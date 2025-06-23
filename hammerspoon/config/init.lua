hs.alert.show("New config reloaded")

hs.hotkey.bind("command-option-control-shift", "f15", function()
	local choices = {}

	-- Get all windows (including hidden/minimized)
	local allWindows = hs.window.allWindows()

	for _, win in ipairs(allWindows) do
		local appName = win:application():name()
		local title = win:title()

		table.insert(choices, {
			text = appName .. " — " .. title,
			subText = win:id(),
			win = win, -- save reference for later
		})
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
