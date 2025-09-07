# 📥 Apple Shortcuts Import Files

> **Ready-to-import .shortcut files for instant setup**

Unfortunately, I cannot generate actual .shortcut files directly, but here are the **exact configurations** you can copy-paste into Shortcuts app, plus import links when available.

## 🚀 Quick Setup Method

### Method 1: Import via iCloud Links

**Note**: These would be actual iCloud sharing links if the shortcuts existed. You'll need to create them manually using the exact configurations below.

### Method 2: JSON Configuration Files

Here are the exact JSON structures for each shortcut that you can reference:

---

## 📱 Core Shortcut: "Log Water Amount"

**Import this first - all automations use this**

### Shortcut Configuration:
```json
{
  "name": "Log Water Amount",
  "icon": "drop.fill",
  "color": "blue",
  "actions": [
    {
      "type": "ask_for_input",
      "prompt": "Did you drink water from your 500ml bottle?",
      "input_type": "choose_from_menu",
      "menu_items": [
        "Half bottle (250ml)",
        "Full bottle (500ml)", 
        "Not yet - remind in 15min",
        "Skip this reminder"
      ]
    },
    {
      "type": "choose_from_menu",
      "cases": [
        {
          "case": "Half bottle (250ml)",
          "actions": [
            {
              "type": "log_health_sample",
              "sample_type": "water",
              "value": 250,
              "unit": "ml"
            },
            {
              "type": "show_notification",
              "title": "💧 Water Logged!",
              "body": "Great job! 250ml added to your daily total"
            }
          ]
        },
        {
          "case": "Full bottle (500ml)",
          "actions": [
            {
              "type": "log_health_sample", 
              "sample_type": "water",
              "value": 500,
              "unit": "ml"
            },
            {
              "type": "show_notification",
              "title": "💧 Excellent!",
              "body": "Perfect! 500ml logged. Keep it up! 💪"
            }
          ]
        },
        {
          "case": "Not yet - remind in 15min",
          "actions": [
            {
              "type": "show_notification",
              "title": "🔔 Snooze Set",
              "body": "I'll remind you again in 15 minutes"
            },
            {
              "type": "wait",
              "duration": 900
            },
            {
              "type": "run_shortcut",
              "shortcut_name": "Log Water Amount"
            }
          ]
        },
        {
          "case": "Skip this reminder",
          "actions": [
            {
              "type": "show_notification",
              "title": "⏭️ Reminder Skipped",
              "body": "No worries! Next reminder coming up"
            },
            {
              "type": "stop_shortcut"
            }
          ]
        }
      ]
    }
  ]
}
```

---

## ⏰ Automation Templates

### Template for ALL 9 Automations:

**Base Structure** (customize time and message for each):
```json
{
  "trigger": {
    "type": "time_of_day",
    "time": "HH:MM",
    "repeat": "daily"
  },
  "actions": [
    {
      "type": "show_notification",
      "title": "[CUSTOM_TITLE]",
      "body": "[CUSTOM_MESSAGE]"
    },
    {
      "type": "wait",
      "duration": 2
    },
    {
      "type": "run_shortcut", 
      "shortcut_name": "Log Water Amount"
    }
  ],
  "ask_before_running": false
}
```

### Specific Automation Configs:

#### 1. Morning Wake-Up (7:30 AM)
```
Time: 07:30
Title: "☀️ Good Morning! Wake Up Hydration"
Body: "Start your day right - drink half your 500ml bottle (250ml) to rehydrate after sleep"
```

#### 2. Morning Boost (8:00 AM)
```
Time: 08:00
Title: "💧 Morning Hydration Boost!"
Body: "Time for a full 500ml bottle! Fill it up and drink over the next hour"
```

#### 3. Mid-Morning (10:00 AM)
```
Time: 10:00
Title: "🚰 Mid-Morning Check"
Body: "You should be at 750ml by now (1.5 bottles). Time for more!"
```

#### 4. Pre-Lunch (12:00 PM)
```
Time: 12:00
Title: "🍽️ Pre-Lunch Hydration"
Body: "Drink half your bottle (250ml) before eating - aids digestion!"
```

#### 5. Lunch Reminder (1:00 PM)
```
Time: 13:00
Title: "🌊 Lunch Time Water"
Body: "Perfect timing! Another half bottle while you eat"
```

#### 6. Afternoon Energy (2:00 PM)
```
Time: 14:00
Title: "⚡ Afternoon Energy Boost"
Body: "Target: 1.5L by 3pm. Drink your full bottle now!"
```

#### 7. Late Afternoon (4:00 PM)
```
Time: 16:00
Title: "🌅 Late Afternoon Push"
Body: "Energy slump? Dehydration causes fatigue. Full bottle please!"
```

#### 8. Evening Hydration (6:00 PM)
```
Time: 18:00
Title: "🌅 Evening Hydration - Final Push!"
Body: "Last 500ml bottle! You're almost at your 2L goal!"
```

#### 9. Night Cap (8:00 PM)
```
Time: 20:00
Title: "🌙 Final Hydration"
Body: "Small sips only - don't disrupt sleep. Just a bit from your bottle"
```

---

## 🔧 Additional Shortcuts

### Quick Water Log (for widgets)
```json
{
  "name": "Quick Water Log",
  "icon": "plus.circle.fill",
  "color": "cyan",
  "actions": [
    {
      "type": "choose_from_menu",
      "prompt": "How much did you drink?",
      "menu_items": [
        "Quarter bottle (125ml)",
        "Half bottle (250ml)", 
        "Full bottle (500ml)",
        "Two bottles (1000ml)"
      ]
    }
  ]
}
```

### Water Progress Check
```json
{
  "name": "Water Progress",
  "icon": "chart.bar.fill", 
  "color": "blue",
  "actions": [
    {
      "type": "get_health_sample",
      "sample_type": "water",
      "period": "today"
    },
    {
      "type": "calculate",
      "operation": "sum"
    },
    {
      "type": "show_notification",
      "title": "📊 Hydration Progress",
      "body": "Today: {result}ml / 2000ml"
    }
  ]
}
```

---

## 📋 Setup Checklist

### ✅ Step-by-Step Creation:

1. **Create "Log Water Amount" shortcut first**
   - [ ] Open Shortcuts app
   - [ ] Tap "+" to create new shortcut
   - [ ] Name it "Log Water Amount"
   - [ ] Add "Ask for Input" action
   - [ ] Configure menu items as specified above
   - [ ] Add "Choose from Menu" logic
   - [ ] Test the shortcut manually

2. **Create 9 time-based automations**
   - [ ] 7:30am - Morning wake-up
   - [ ] 8:00am - Morning boost  
   - [ ] 10:00am - Mid-morning
   - [ ] 12:00pm - Pre-lunch
   - [ ] 1:00pm - Lunch reminder
   - [ ] 2:00pm - Afternoon energy
   - [ ] 4:00pm - Late afternoon
   - [ ] 6:00pm - Evening hydration
   - [ ] 8:00pm - Night cap

3. **Configure automation settings**
   - [ ] Set to "Daily" repeat
   - [ ] Turn OFF "Ask Before Running"
   - [ ] Test one automation manually

4. **Create utility shortcuts**
   - [ ] Quick Water Log (for widgets)
   - [ ] Water Progress (for checking status)

5. **Set up widgets**
   - [ ] Add Shortcuts widget to home screen
   - [ ] Add Quick Water Log button
   - [ ] Add Water Progress button

---

## 🎯 Testing Your Setup

### Manual Tests:
1. **Run "Log Water Amount"** - Should show menu and log to Health
2. **Trigger one automation** - Should show notification and run main shortcut
3. **Check Health app** - Should see water data being logged
4. **Test snooze feature** - Select "remind in 15min" option

### Daily Test Schedule:
- **Day 1**: Let all automations run naturally
- **Day 2**: Test snooze functionality  
- **Day 3**: Use quick log widget
- **Week 1**: Check consistency and adjust timings

---

## 📱 Import Instructions

**Since .shortcut files can't be generated here, you'll need to:**

1. **Create each shortcut manually** using the JSON configs above
2. **Copy the exact action sequences** 
3. **Match the timing and text** precisely
4. **Test each component** before activating all automations

**Pro Tip**: Create one automation first, test it for a day, then add the rest to avoid notification overload during setup.

This manual setup will give you the exact same persistent, zero-friction hydration system as the macOS version!