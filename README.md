# 🚰 Zero Friction Hydration System

> **Automated 2L daily water tracking with persistent macOS notifications**

A complete system that removes all friction from drinking 2 liters of water daily through automation, smart reminders, and effortless tracking.

## ✨ Features

- 🔔 **Persistent notifications** that stay until dismissed
- ⏰ **Smart scheduling** optimized for daily routines  
- 🍶 **500ml bottle-based measurements** (intuitive portions)
- 💧 **Emacs integration** with quick logging commands
- 📊 **Org-mode tracking** with progress tables and streaks
- 🎮 **Gamification** with points and achievement milestones
- 😴 **15-minute snooze** option for busy moments

## 🚀 Quick Start

### 1. Install the System

**For macOS:**
```bash
git clone <your-repo-url>
cd hydration-system

# Make scripts executable
chmod +x *.sh

# Set up automated reminders
./update-crontab-persistent.sh
```

**For iPhone:**
This system is designed for macOS, but you can recreate it on iPhone using:
- **Shortcuts app** - Create automations for water reminders
- **Water reminder apps** - WaterMinder, Hydro Coach, or Daily Water
- **Apple Watch** - Use built-in Water tracking with haptic reminders

### 2. Configure Your Environment (Optional)
If you use Emacs, add the hydration functions to your `init.el` - see the sample code in `HYDRATION_SYSTEM_GUIDE.md`.

### 3. Start Hydrating!
- Notifications will appear automatically during work hours
- Click "Drank from bottle!" when you've hydrated
- Use "Snooze 15min" if you're busy

## 📋 Files Included

| File | Purpose |
|------|---------|
| `water-reminder-persistent.sh` | Main notification script (persistent dialogs) |
| `water-reminder.sh` | Original notification script (standard) |
| `update-crontab-persistent.sh` | One-click crontab setup for persistent notifications |
| `setup-water-crontab.sh` | One-click crontab setup for standard notifications |
| `hydration-tracker.org` | Detailed tracking template for Org-mode |
| `HYDRATION_SYSTEM_GUIDE.md` | Complete setup guide and pro tips |

## 🎯 Daily Schedule

Perfect for **500ml bottle users**:

| Time | Reminder | Amount | Bottle Equivalent |
|------|----------|--------|------------------|
| 7:30am | Wake up hydration | 250ml | Half bottle |
| 9:00am | Morning boost | 500ml | Full bottle |
| 12:00pm | Pre-lunch | 250ml | Half bottle |
| 2:00pm | Afternoon energy | 500ml | Full bottle |
| 5:00pm | Evening hydration | 500ml | Full bottle |
| 8:00pm | Final sips | 250ml | Half bottle |
| **Total** | **Daily goal** | **2250ml** | **4.5 bottles** |

*Exceeds 2L goal for buffer*

## ⚙️ How It Works

### Persistent Notifications
- Dialog boxes appear at scheduled times
- Stay visible until you interact with them
- No more missed reminders!

### Smart Messaging
Messages adapt to time of day:
- **Morning**: "Start with half your 500ml bottle"
- **Afternoon**: "Target: 1.5L by 3pm. Drink your full bottle!"
- **Evening**: "Final bottle! You're almost at 2L"

### Flexible Options
- **Drink & dismiss**: Click "Drank from bottle!"
- **Snooze**: Get reminded again in 15 minutes
- **Manual tracking**: Use Emacs commands or update org file

## 🛠️ Customization

### Change Notification Times
```bash
crontab -e
# Edit the schedule lines to your preference
```

### Modify Messages
Edit the `case` statement in `water-reminder-persistent.sh` to change messages for different times.

### Different Bottle Size
1. Update the `BOTTLE_SIZE` variable in scripts
2. Adjust messages to match your bottle measurements

## 🏆 Pro Tips

### Physical Setup
- Keep bottles at: bedside, desk, kitchen, car
- Use rubber bands to mark 250ml intervals
- Room temperature water = easier to drink large amounts

### Habit Formation
- Link to existing routines (after bathroom breaks)
- Drink before meals (aids digestion)
- Use visual cues (always visible bottle)

### Tracking Methods
- **Quick**: Use Emacs `C-c w q` commands  
- **Detailed**: Update the org-mode table daily
- **Minimal**: Just click the notification dialogs

## 📱 Emacs Integration (Optional)

Add these keybindings for instant logging:

```elisp
;; Quick hydration logging
(global-set-key (kbd "C-c w q") 'hydration-quick-log)  ; Choose amount
(global-set-key (kbd "C-c w s") 'hydration-status)     ; Show progress  
(global-set-key (kbd "C-c w d") 'hydration-drink)      ; Custom amount
```

## 🎮 Achievement System

| Milestone | Reward | Points |
|-----------|--------|--------|
| First 2L day | 🏆 Success! | 100 |
| 7-day streak | 💪 Habit forming | 500 |
| 30-day streak | ⭐ True habit | 1000 |
| 100-day streak | 🚀 Lifestyle change | 5000 |

## 🔧 Troubleshooting

### Notifications Not Appearing?
```bash
# Check crontab is set
crontab -l | grep water

# Test manually  
./water-reminder-persistent.sh
```

### Permissions Issues?
```bash
chmod +x *.sh
```

### Want to Stop Notifications?
```bash
crontab -e
# Comment out or delete the water reminder lines
```

## 🤝 Contributing

Ideas for improvements:
- [ ] iOS/Android companion app
- [ ] Integration with fitness trackers
- [ ] Weather-based hydration adjustments
- [ ] Workspace-specific bottle tracking
- [ ] Social challenges and sharing

## 📄 License

MIT License - Feel free to modify and share!

---

## 💧 Why This System Works

**Traditional approach**: "Remember to drink water" ❌  
**This system**: "Water appears, you drink, system tracks" ✅

By removing all friction—finding water, remembering to drink, tracking progress—your brain can focus on building the habit rather than managing the logistics.

**Result**: 2L daily hydration becomes automatic within 7-21 days.

---

*Created with ❤️ for healthier hydration habits*