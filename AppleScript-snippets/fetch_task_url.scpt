on run {input, parameters}
	-- At this time the script works only for one single selected task
	tell application "OmniFocus"
		tell front document
			tell document window 1
				set theSelectedItems to selected trees of content
				if ((count of theSelectedItems) < 1) then
					display alert "You must first select a single task." message "Select a single task before running this script." as warning
					return
				end if
				if ((count of theSelectedItems) > 1) then
					display alert "This script handles only one task at a single blow!" message "Select a single task before running this script." as warning
					return
				end if
			end tell
		end tell
	end tell
	
	
	
	tell application "OmniFocus"
		set theDoc to document window 1 of document 1
		
		set theSelectedTask to the value of the first item of the selected tree of the content of theDoc

		set theNewTaskId to the id of theSelectedTask		
		set theNewTaskUrl to "omnifocus:///task/" & (theNewTaskId as text)
		theNewTaskUrl
	end tell
end run
