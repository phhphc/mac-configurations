local masterKey = {
	mod = "command-option-control-shift",
	key = "f15",
}

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
			local id = win:id()
			if title and title ~= "" then
				-- Get the icon using the correct method
				local icon = nil
				local bundleID = app:bundleID()
				if bundleID then
					icon = hs.image.imageFromAppBundle(bundleID)
				end

				table.insert(choices, {
					text = (id and windowAlias:getAlias(win)) or title,
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

---@param choices {win: hs.window}[]
local function startChooseWindow(choices)
	-- local titles = {}
	-- for _, choice in ipairs(choices) do
	-- 	table.insert(titles, choice.win:title())
	-- end
	-- local keys = getChar(titles)
	-- hs.alert.show(hs.inspect(keys))

	---@param choice {win: hs.window}
	local chooser = hs.chooser.new(function(choice)
		if choice and choice.win then
			local win = choice.win
			---@type hs.application | nil
			local app = win:application()
			if app then app:activate() end
			win:focus()
		end
	end)

	chooser:choices(choices)
	chooser:searchSubText(true)
	chooser:show()
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
hs.hotkey.bind(masterKey.mod, masterKey.key, function()
	windowModal:enter()
end)


hs.hotkey.bind("cmd-shift", "h", function()
	---@type hs.window | nil
	local win = hs.window.focusedWindow()
	if win then
		windowAlias:setAlias(win)
	end
end)
