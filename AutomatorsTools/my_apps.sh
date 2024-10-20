#!/bin/bash

function MyAppsID(){
# Print header with proper column widths
printf "%-10s | %-50s | %-s\n" "PID" "Bundle ID" "Application Name"
echo "--------------------------------------------------------------------------------"

# Get the list of currently running applications with their IDs and names
osascript -e 'tell application "System Events" to get the name of every process whose background only is false' | tr ',' '\n' | while read app_name
do
    # Get the PID and bundle identifier for each app
    app_pid=$(pgrep -x "$app_name")
    app_id=$(osascript -e "id of app \"$app_name\"")

    # Print the PID, bundle identifier, and app name with proper formatting
    if [[ ! -z "$app_pid" ]]; then
        printf "%-10s | %-50s | %-s\n" "$app_pid" "$app_id" "$app_name"
    fi
done
}

MyAppsID
