#!/bin/bash

# Setup crontab entries for water reminders
# This script adds automated water reminders to your crontab

echo "🚰 Setting up automated water reminders..."

# Create temporary crontab file
TEMP_CRON=$(mktemp)

# Get existing crontab (if any)
crontab -l 2>/dev/null > "$TEMP_CRON"

# Add water reminder entries (every 2 hours during work day)
cat << 'EOF' >> "$TEMP_CRON"

# 💧 Automated Water Reminders - 2L Daily Goal
# Runs every 2 hours from 8am to 8pm
0 8,10,12,14,16,18,20 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder.sh >/dev/null 2>&1

# Extra reminders for key times
30 7 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder.sh >/dev/null 2>&1
0 13 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder.sh >/dev/null 2>&1

EOF

# Install the new crontab
crontab "$TEMP_CRON"

# Clean up
rm "$TEMP_CRON"

echo "✅ Crontab configured! Water reminders will run:"
echo "   - Every 2 hours: 8am, 10am, 12pm, 2pm, 4pm, 6pm, 8pm"
echo "   - Extra: 7:30am (wake up) and 1pm (lunch)"
echo ""
echo "📋 To check your crontab: crontab -l"
echo "🗑️  To remove reminders: crontab -e (then delete the water lines)"
echo ""
echo "🎯 Your zero-friction hydration system is now active!"