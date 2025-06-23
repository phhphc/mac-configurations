hs.alert.show("New config reloaded")

local masterKey = {
	mod = "command-option-control-shift",
	key = "f15",
}

hs.hotkey.bind(masterKey.mod, masterKey.key, function()
	local choices = {}

	-- Get all windows (including hidden/minimized)
	local allWindows = hs.window.allWindows()

	for _, win in ipairs(allWindows) do
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
				text = appName .. " - " .. title,
				subText = tostring(win:id()),
				image = icon,
				win = win, -- save reference for later
			})
		end
	end

	-- Show the chooser
	local chooser = hs.chooser.new(function(choice)
		if choice and choice.win then
			local win = choice.win
			win:application():activate()
			win:focus()
		end
	end)

	chooser:choices(choices)
	chooser:searchSubText(true) -- include subtext in search
	chooser:show()
end)
