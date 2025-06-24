hs.alert.show("New config reloaded")

local masterKey = {
	mod = "command-option-control-shift",
	key = "f15",
}

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
			local appName = app:name() or "Unknown App"
			local title = win:title() or "Untitled"
			local icon = nil

			-- Get the icon using the correct method
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

	return choices
end

-- Create modal hotkey system
local windowModal = hs.hotkey.modal.new()
local autoExitTimer = nil

-- Style for top-right positioned alerts
local topRightAlertStyle = {
	textFont = "Helvetica",
	textSize = 18,
	radius = 10,
	atScreenEdge = 1, -- top right
	fadeInDuration = 0.15,
	fadeOutDuration = 0.15,
}

-- Helper function to handle window selection logic
local function handleWindowSelection(appName, appDisplayName)
	return function()
		-- Cancel auto-exit timer since user took an action
		if autoExitTimer then
			autoExitTimer:stop()
			autoExitTimer = nil
		end

		local windows = findWindowsByAppName(appName)

		if #windows == 0 then
			hs.alert.show("No " .. appDisplayName .. " windows found", topRightAlertStyle)
		elseif #windows == 1 then
			-- Focus the single window
			local win = windows[1]
			win:application():activate()
			win:focus()
			hs.alert.show("Focused " .. appDisplayName .. " window", topRightAlertStyle)
		else
			-- Show chooser for multiple windows
			local choices = createChoicesFromWindows(windows)

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
		windowModal:exit()
	end
end

-- Override the entered/exited functions to show feedback
function windowModal:entered()
	hs.alert.show("Window Mode: J=IntelliJ, T=Kitty, F=Firefox, C=Cursor, ESC=Exit", topRightAlertStyle)

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

	-- hs.alert.show("Window Mode Exited", topRightAlertStyle)
end

-- Bind keys in modal mode
windowModal:bind("", "j", nil, handleWindowSelection("IntelliJ IDEA", "IntelliJ IDEA"))
windowModal:bind("", "t", nil, handleWindowSelection("kitty", "Kitty"))
windowModal:bind("", "f", nil, handleWindowSelection("Firefox", "Firefox"))
windowModal:bind("", "c", nil, handleWindowSelection("Cursor", "Cursor"))
windowModal:bind("", "o", nil, handleWindowSelection("Obsidian", "Obsidian"))
windowModal:bind("", "z", nil, handleWindowSelection("Zalo", "Zalo"))

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
