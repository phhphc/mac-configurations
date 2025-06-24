local masterKey = {
	mod = "command-option-control-shift",
	key = "f15",
}

local alert = require("src.lib.one_alert"):new({
	textSize = 14,
	radius = 8,
	atScreenEdge = 1,
})


---@class WindowFocus
---@field private launchedApp boolean
local WindowFocus = {}
WindowFocus.__index = WindowFocus

function WindowFocus:new()
	local self = setmetatable({}, WindowFocus)
	return self
end

---@private
---@return hs.window[]
function WindowFocus:findWindowsByAppName(appName)
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

---@private
function WindowFocus:createChoicesFromWindows(windows)
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
					text = title,
					subText = win:screen():name() or "Unknown Screen",
					image = icon,
					win = win,
				})
			end
		end
	end

	return choices
end

function WindowFocus:handleWindowSelection(appName, appDisplayName)
	self.launchedApp = true

	local windows = self:findWindowsByAppName(appName)

	local choices = self:createChoicesFromWindows(windows)

	if #choices == 0 then
		alert:show("No " .. appDisplayName .. " windows found", 1)
	elseif #choices == 1 then
		-- Focus the single window
		local win = windows[1]
		win:application():activate()
		win:focus()
		alert:show("Focused " .. appDisplayName .. " window", 0.4)
	else
		local chooser = hs.chooser.new(function(choice)
			if choice and choice.win then
				local win = choice.win
				win:application():activate()
				win:focus()
			end
		end)

		chooser:choices(choices)
		chooser:searchSubText(true)
		chooser:show()
	end
end

function WindowFocus:handleEnter()
	alert:show("Window Mode: J=IntelliJ, T=Kitty, F=Firefox, C=Cursor, ESC=Exit")
end

function WindowFocus:handleEscape()
	if not self.launchedApp then
		self.launchedApp = false
		alert:close()
	end
end

local windowFocus = WindowFocus:new()

-- Create modal hotkey system
local windowModal = hs.hotkey.modal.new()

function windowModal:entered() windowFocus:handleEnter() end

function windowModal:exited() windowFocus:handleEscape() end

local function bindWindowModal(key, appName)
	windowModal:bind("", key, function()
		windowFocus:handleWindowSelection(appName, appName)
		windowModal:exit()
	end)
end

-- Bind keys in modal mode
bindWindowModal("j", "IntelliJ IDEA")
bindWindowModal("t", "Kitty")
bindWindowModal("f", "Firefox")
bindWindowModal("c", "Cursor")
bindWindowModal("o", "Obsidian")
bindWindowModal("z", "Zalo")
bindWindowModal("a", "ChatGPT")

local autoExitTimer = nil

-- Bind escape key to exit modal
windowModal:bind("", "escape", function()
	if autoExitTimer then
		autoExitTimer:stop()
		autoExitTimer = nil
	end
	windowModal:exit()
end)

-- Bind master key to enter modal
hs.hotkey.bind(masterKey.mod, masterKey.key, function()
	autoExitTimer = hs.timer.doAfter(1, function()
		if windowModal then
			windowModal:exit()
		end
	end)
	windowModal:enter()
end)
