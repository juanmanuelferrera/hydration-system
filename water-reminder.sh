#!/bin/bash

# Water Reminder Script - Sends macOS notifications to drink water
# Run this script to get hourly reminders during work hours

# Configuration
DAILY_GOAL=2000  # ml
BOTTLE_SIZE=500  # ml
DRINKS_NEEDED=$((DAILY_GOAL / BOTTLE_SIZE))

# Get current hour
HOUR=$(date +%H)

# Water intake messages based on time of day
case $HOUR in
    7|8)
        MESSAGE="☀️ Good morning! Start with 250ml of water to rehydrate"
        SUBTITLE="Your body needs water after 7-8 hours of sleep"
        ;;
    9|10)
        MESSAGE="💧 Time for your morning 500ml!"
        SUBTITLE="Fill your bottle and drink it over the next hour"
        ;;
    11)
        MESSAGE="🚰 Mid-morning hydration check"
        SUBTITLE="You should be at 750ml by now. Drink up!"
        ;;
    12|13)
        MESSAGE="🍽️ Pre-lunch water time!"
        SUBTITLE="Drink 250ml before eating - aids digestion"
        ;;
    14|15)
        MESSAGE="🌊 Afternoon hydration boost"
        SUBTITLE="Target: 1.5L by 3pm. Fill that bottle!"
        ;;
    16|17)
        MESSAGE="⚡ Energy slump? Drink water!"
        SUBTITLE="Dehydration causes fatigue. 500ml please!"
        ;;
    18|19)
        MESSAGE="🌅 Evening hydration"
        SUBTITLE="Last 500ml push! You're almost at 2L"
        ;;
    20|21)
        MESSAGE="🌙 Final water for the day"
        SUBTITLE="Small sips only - don't disrupt sleep"
        ;;
    *)
        # Outside work hours, no notification
        exit 0
        ;;
esac

# Send persistent macOS notification using osascript with alert dialog
osascript <<EOF
tell application "System Events"
    activate
    display dialog "$SUBTITLE" with title "💧 Water Reminder: $MESSAGE" buttons {"I'll drink later", "Just drank water!"} default button 2 with icon note giving up after 300
    set user_response to button returned of result
    
    if user_response is "Just drank water!" then
        display notification "Great job staying hydrated! 💧" with title "Water Logged" sound name "Glass"
    else
        display notification "Reminder set for later 🔔" with title "Water Reminder" sound name "Basso"
    end if
end tell
EOF

# Also speak the reminder (optional - comment out if too intrusive)
# say "$MESSAGE"

# Log water reminder to file
echo "$(date '+%Y-%m-%d %H:%M') - Reminded: $MESSAGE" >> ~/.emacs.d/water-log.txt