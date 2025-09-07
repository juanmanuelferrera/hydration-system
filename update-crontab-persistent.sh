#!/bin/bash

# Update crontab to use persistent notifications instead of regular ones

echo "🔄 Updating crontab to use persistent water reminders..."

# Create temporary crontab file
TEMP_CRON=$(mktemp)

# Get existing crontab and remove old water reminders
crontab -l 2>/dev/null | grep -v "water-reminder.sh" > "$TEMP_CRON"

# Add new persistent water reminder entries
cat << 'EOF' >> "$TEMP_CRON"

# 💧 Persistent Water Reminders - 500ml Bottle System
# Reminders stay until clicked/closed
0 8,10,12,14,16,18,20 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder-persistent.sh >/dev/null 2>&1

# Extra reminders for key times  
30 7 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder-persistent.sh >/dev/null 2>&1
0 13 * * * /Users/juanmanuelferreradiaz/.emacs.d/water-reminder-persistent.sh >/dev/null 2>&1

EOF

# Install the new crontab
crontab "$TEMP_CRON"

# Clean up
rm "$TEMP_CRON"

echo "✅ Crontab updated! Persistent water reminders will now:"
echo "   - Stay on screen until you click 'Drank from bottle!'"
echo "   - Show 500ml bottle measurements (half bottle = 250ml)"
echo "   - Allow snoozing for 15 minutes if needed"
echo ""
echo "🔍 To check: crontab -l"
echo "📱 Next reminder will appear at the scheduled time"