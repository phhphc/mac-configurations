local MASTER_KEY = "f16"

local alert = require("src.lib.one_alert"):new({
	textSize = 14,
	radius = 8,
	atScreenEdge = 1,
})

local windowAlias = require("src.lib.window_alias"):new()

local getChar = require("src.lib.key_assignment").getChars

-- Helper function to find windows by application name
local function findWindowsByAppName(appName)
	local windows = {}
	local allWindows = hs.window.allWindows()

	for _, win in ipairs(allWindows) do
		local app = win:application()
		if app and app:name() == appName then
			table.insert(windows, win)
		end
	end

	return windows
end

-- Helper function to create chooser choices from windows
local function createChoicesFromWindows(windows)
	local choices = {}

	for _, win in ipairs(windows) do
		local app = win:application()
		if app then
			local title = win:title()
			if title and title ~= "" then
				-- Get the icon using the correct method
				local icon = nil
				local bundleID = app:bundleID()
				if bundleID then
					icon = hs.image.imageFromAppBundle(bundleID)
				end

				table.insert(choices, {
					text = windowAlias:getAlias(win),
					subText = win:screen():name() or "Unknown Screen",
					image = icon,
					win = win,
				})
			end
		end
	end

	return choices
end

-- Create modal hotkey system
local windowModal = hs.hotkey.modal.new()
local autoExitTimer = nil
local launchedApp = false

-- Style for top-right positioned alerts
local topRightAlertStyle = {
	textFont = "Helvetica",
	textSize = 18,
	radius = 10,
	atScreenEdge = 1, -- top right
	fadeInDuration = 0.15,
	fadeOutDuration = 0.15,
}

---@param choices {win: hs.window, text: string}[]
local function startChooseWindow(choices)
	local titles = {}
	for _, choice in ipairs(choices) do
		table.insert(titles, choice.text)
	end
	local keys = getChar(titles)

	---@type table<string, string>
	local keyByTitle = {}
	for _, key in ipairs(keys) do
		keyByTitle[key.text] = key.char
	end

	for _, choice in ipairs(choices) do
		choice.char = keyByTitle[choice.text]
		choice.text = keyByTitle[choice.text] .. " -- " .. choice.text
	end

	local alertMessage = ""
	for _, choice in ipairs(choices) do
		alertMessage = alertMessage .. "\n" .. choice.text
	end

	local choseModal = hs.hotkey.modal.new()

	local alertId = nil;
	local newTimer = nil;

	function choseModal:entered()
		local alertDuration = 10
		newTimer = hs.timer.doAfter(alertDuration, function() choseModal:exit() end)
		alertId = hs.alert.show(alertMessage, alertDuration+2)
	end

	function choseModal:exited()
		if alertId then hs.alert.closeSpecific(alertId) end
		if newTimer then newTimer:stop() end
	end

	choseModal:bind("", "escape", function() choseModal:exit() end)

	for _, choice in ipairs(choices) do
		choseModal:bind("", choice.char, function()
			choice.win:application():activate()
			choice.win:focus()
			choseModal:exit()
		end)
	end

	choseModal:enter()

	-- ---@param choice {win: hs.window}
	-- local chooser = hs.chooser.new(function(choice)
	-- 	if choice and choice.win then
	-- 		local win = choice.win
	-- 		---@type hs.application | nil
	-- 		local app = win:application()
	-- 		if app then app:activate() end
	-- 		win:focus()
	-- 	end
	-- end)

	-- chooser:choices(choices)
	-- chooser:searchSubText(true)
	-- chooser:show()
end

-- Helper function to handle window selection logic
local function handleWindowSelection(appName, appDisplayName)
	return function()
		launchedApp = true
		-- Cancel auto-exit timer since user took an action
		if autoExitTimer then
			autoExitTimer:stop()
			autoExitTimer = nil
		end

		local windows = findWindowsByAppName(appName)

		local choices = createChoicesFromWindows(windows)

		if #choices == 0 then
			alert:show("No " .. appDisplayName .. " windows found", 1)
		elseif #choices == 1 then
			-- Focus the single window
			local win = windows[1]
			win:application():activate()
			win:focus()
			alert:show("Focused " .. appDisplayName .. " window", 0.4)
		else
			startChooseWindow(choices)
		end
		windowModal:exit()
	end
end

-- Override the entered/exited functions to show feedback
function windowModal:entered()
	alert:show("Window Mode: J=IntelliJ, T=Kitty, F=Firefox, C=Cursor, ESC=Exit")

	-- Start auto-exit timer (1 second)
	autoExitTimer = hs.timer.doAfter(1, function()
		if windowModal then
			windowModal:exit()
		end
	end)
end

function windowModal:exited()
	-- Clean up timer when exiting
	if autoExitTimer then
		autoExitTimer:stop()
		autoExitTimer = nil
	end

	if not launchedApp then
		alert:close()
	else
		launchedApp = false
	end
end

-- Bind keys in modal mode
windowModal:bind("", "j", handleWindowSelection("IntelliJ IDEA", "IntelliJ IDEA"))
windowModal:bind("", "t", handleWindowSelection("kitty", "Kitty"))
windowModal:bind("", "f", handleWindowSelection("Firefox", "Firefox"))
windowModal:bind("", "c", handleWindowSelection("Cursor", "Cursor"))
windowModal:bind("", "o", handleWindowSelection("Obsidian", "Obsidian"))
windowModal:bind("", "z", handleWindowSelection("Zalo", "Zalo"))
windowModal:bind("", "a", handleWindowSelection("ChatGPT", "GPTalo"))

-- Bind escape key to exit modal
windowModal:bind("", "escape", function()
	-- Cancel auto-exit timer since user took an action
	if autoExitTimer then
		autoExitTimer:stop()
		autoExitTimer = nil
	end
	windowModal:exit()
end)

-- Bind master key to enter modal
hs.hotkey.bind("", MASTER_KEY, function()
	windowModal:enter()
end)

hs.hotkey.bind("control", MASTER_KEY, function()
	---@type hs.window | nil
	local win = hs.window.focusedWindow()
	if win then
		windowAlias:setAlias(win)
	end
end)
