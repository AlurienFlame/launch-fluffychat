#!/usr/bin/fish

# Get the window id of a fluffychat window
set fishwindowid (xdotool search --class fluffychat | tail -n 1)

# Launch
if test -z $fishwindowid # If there is no fluffychat instance
    set fishwindowid (fluffychat &) # Fork into a fluffychat instance and get its window id
    exit 0
end

# Get the window id of a fluffychat window, but only if it is visible
set visiblefishwindowid (xdotool search --onlyvisible --class fluffychat  | tail -n 1)
echo $visiblefishwindowid

if test -z $visiblefishwindowid # If there is no fluffychat window visible
    xdotool windowactivate $fishwindowid # Activate the window
    exit 0
end
xdotool windowminimize $fishwindowid # Otherwise, minimize the window
