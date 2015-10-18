on run {input, parameters}
	set input_url to first item of input
	set input_text to the second item of input
	
	--display alert (input as text)
	set the clipboard to "<a href=\"" & input_url & "\" target=\"_blank\">" & input_text & "</a>"
	set theHEX to do shell script "pbpaste | hexdump -ve '1/1 \"%.2x\"'"
	if theHEX is "" then
		beep
	else
		run script "set the clipboard to «data HTML" & theHEX & "»"
	end if
	
	set appName to "Vitamin-R 2"
	
	tell application appName
		activate
	end tell
	
	tell application "System Events"
		set this_info to {}
		tell process appName
			set frontmost to true
			set theWindows to windows
			set windowsCount to count of theWindows
			set mainWindow to window 1
			
			set currentStep to name of static text 1 of mainWindow
			
			if currentStep = "On an Open-Ended Break…" then
				click button "Continue" of window 1
				--return "OK"
			end if
			
			set currentStep to name of static text 1 of mainWindow
			if currentStep = "Define the Objective for This Time Slice" then
				set objectiveArea to text area 1 of scroll area 1 of window 1
				set value of objectiveArea to ""
				get the value of objectiveArea
				keystroke "v" using {command down}
				get the value of objectiveArea
				click button "Continue" of window 1
				click button "Hide Checked" of window 1
				click button "Start" of window 1
				--UI elements of window 1
			end if
		end tell
	end tell
	return input
end run
