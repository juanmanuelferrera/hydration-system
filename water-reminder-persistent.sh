#!/bin/bash

# Persistent Water Reminder Script - Uses terminal-notifier for sticky notifications
# Requires: brew install terminal-notifier

# Configuration
DAILY_GOAL=2000  # ml
BOTTLE_SIZE=500  # ml
DRINKS_NEEDED=$((DAILY_GOAL / BOTTLE_SIZE))

# Get current hour
HOUR=$(date +%H)

# Water intake messages based on time of day
case $HOUR in
    7|8)
        MESSAGE="☀️ Good morning! Start with half your 500ml bottle"
        SUBTITLE="Rehydrate after 7-8 hours of sleep (250ml)"
        ;;
    9|10)
        MESSAGE="💧 Time for a full 500ml bottle!"
        SUBTITLE="Fill your bottle and drink it over the next hour"
        ;;
    11)
        MESSAGE="🚰 Mid-morning hydration check"
        SUBTITLE="You should be at 750ml by now (1.5 bottles)"
        ;;
    12|13)
        MESSAGE="🍽️ Pre-lunch water time!"
        SUBTITLE="Drink half your bottle before eating (250ml)"
        ;;
    14|15)
        MESSAGE="🌊 Afternoon hydration boost"
        SUBTITLE="Target: 1.5L by 3pm. Drink your full bottle!"
        ;;
    16|17)
        MESSAGE="⚡ Energy slump? Drink water!"
        SUBTITLE="Dehydration causes fatigue. Full bottle please!"
        ;;
    18|19)
        MESSAGE="🌅 Evening hydration - final bottle!"
        SUBTITLE="Last 500ml push! You're almost at 2L"
        ;;
    20|21)
        MESSAGE="🌙 Final sips for the day"
        SUBTITLE="Small sips from bottle - don't disrupt sleep"
        ;;
    *)
        # Outside work hours, no notification
        exit 0
        ;;
esac

# Check if terminal-notifier is available
if command -v terminal-notifier &> /dev/null; then
    # Use terminal-notifier for persistent notifications
    terminal-notifier \
        -title "💧 Water Reminder" \
        -subtitle "$MESSAGE" \
        -message "$SUBTITLE" \
        -sound Glass \
        -timeout 0 \
        -closeLabel "Drank water!" \
        -actions "Snooze 15min,Log 1/4 bottle,Log 1/2 bottle,Log Full bottle" \
        -dropdownLabel "Quick Log" \
        -reply false \
        -group "hydration"
        
else
    # Fallback to osascript with dialog (persistent until clicked)
    osascript <<EOF
try
    tell application "System Events"
        activate
        set user_response to display dialog "$SUBTITLE

Your 500ml bottle is your guide:
• Half bottle = 250ml
• Full bottle = 500ml

Click when done or snooze for later." with title "💧 $MESSAGE" buttons {"Snooze 15min", "Drank from bottle!"} default button 2 with icon note
        
        if button returned of user_response is "Drank from bottle!" then
            display notification "Excellent! Stay hydrated 💪" with title "Water Logged ✓" sound name "Glass"
        else
            display notification "Reminder snoozed for 15 minutes 🔔" with title "Water Reminder" sound name "Basso"
            -- Schedule a 15-minute snooze
            do shell script "echo '/Users/juanmanuelferreradiaz/.emacs.d/water-reminder-persistent.sh' | at now + 15 minutes 2>/dev/null" without altering line endings
        end if
    end tell
on error
    -- If user cancels, just exit quietly
end try
EOF
fi

# Log reminder to file
echo "$(date '+%Y-%m-%d %H:%M') - Persistent reminder: $MESSAGE" >> ~/.emacs.d/water-log.txt