tell application "System Events"
	tell application process "SystemUIServer"
		try
			key down option
			click menu bar item "Notification Center, Do Not Disturb enabled" of menu bar 2
			--click menu bar item "Notification Center" of menu bar 2
			key up option
		on error
			key up option
		end try
	end tell
end tell
