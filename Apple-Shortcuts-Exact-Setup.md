# 📱 Apple Shortcuts: Exact Hydration System Setup

> **Step-by-step recreation of the macOS persistent notifications using iOS Shortcuts**

This guide provides the **exact Shortcuts configurations** to replicate the zero-friction hydration system on iPhone.

## 🎯 Complete Setup Overview

We'll create **9 automations** that mirror the macOS schedule:
- 7:30am, 8:00am, 10:00am, 12:00pm, 1:00pm, 2:00pm, 4:00pm, 6:00pm, 8:00pm

Each automation will:
1. Show persistent notification
2. Ask for confirmation  
3. Log to Health app
4. Show progress toward 2L goal

---

## 📋 Setup Instructions

### Step 1: Create Master Water Logging Shortcut

**This shortcut will be called by all automations**

1. **Open Shortcuts app** → **"+" Create Shortcut**
2. **Name**: "Log Water Amount"
3. **Add these actions in order**:

#### Action 1: Get Input
- **Action**: "Ask for Input"
- **Prompt**: "Did you drink water from your 500ml bottle?"
- **Input Type**: "Choose from Menu"
- **Menu Items**: 
  - "Half bottle (250ml)"
  - "Full bottle (500ml)" 
  - "Not yet - remind in 15min"
  - "Skip this reminder"

#### Action 2: Choose from Menu
- **Action**: "Choose from Menu" (automatically added)
- **Configure each menu item**:

**Menu Item 1: "Half bottle (250ml)"**
- **Log Health Sample**: 
  - **Sample Type**: Water
  - **Value**: 250
  - **Unit**: ml
- **Show Notification**:
  - **Title**: "💧 Water Logged!"
  - **Body**: "Great job! 250ml added to your daily total"
- **Add to Variable**: Set variable "amount" to 250

**Menu Item 2: "Full bottle (500ml)"**
- **Log Health Sample**:
  - **Sample Type**: Water  
  - **Value**: 500
  - **Unit**: ml
- **Show Notification**:
  - **Title**: "💧 Excellent!"
  - **Body**: "Perfect! 500ml logged. Keep it up! 💪"
- **Add to Variable**: Set variable "amount" to 500

**Menu Item 3: "Not yet - remind in 15min"**
- **Show Notification**:
  - **Title**: "🔔 Snooze Set"
  - **Body**: "I'll remind you again in 15 minutes"
- **Wait**: 900 seconds (15 minutes)
- **Run Shortcut**: "Log Water Amount" (recursive call)

**Menu Item 4: "Skip this reminder"**
- **Show Notification**:
  - **Title**: "⏭️ Reminder Skipped" 
  - **Body**: "No worries! Next reminder coming up"
- **Stop Shortcut**

#### Action 3: Calculate Daily Progress (Optional)
- **Get Health Sample**: Water, Today
- **Calculate**: Sum all values
- **Calculate**: Divide by 2000, multiply by 100 (percentage)
- **Show Notification**:
  - **Title**: "📊 Daily Progress"
  - **Body**: "You're at [percentage]% of your 2L goal!"

4. **Save the shortcut**

---

### Step 2: Create Time-Based Automations

**Create 9 separate automations for each time slot**

#### Automation 1: Morning Wake-Up (7:30 AM)

1. **Shortcuts app** → **Automation tab** → **"+"**
2. **Create Personal Automation** → **Time of Day**
3. **Time**: 7:30 AM
4. **Repeat**: Daily
5. **Actions**:

```
Show Notification:
  Title: "☀️ Good Morning! Wake Up Hydration"
  Body: "Start your day right - drink half your 500ml bottle (250ml) to rehydrate after sleep"
  
Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

6. **Turn off "Ask Before Running"**
7. **Done**

#### Automation 2: Morning Boost (8:00 AM)

1. **Time of Day** → **8:00 AM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "💧 Morning Hydration Boost!"
  Body: "Time for a full 500ml bottle! Fill it up and drink over the next hour"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 3: Mid-Morning (10:00 AM)

1. **Time of Day** → **10:00 AM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🚰 Mid-Morning Check"
  Body: "You should be at 750ml by now (1.5 bottles). Time for more!"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 4: Pre-Lunch (12:00 PM)

1. **Time of Day** → **12:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🍽️ Pre-Lunch Hydration"
  Body: "Drink half your bottle (250ml) before eating - aids digestion!"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 5: Lunch Reminder (1:00 PM)

1. **Time of Day** → **1:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🌊 Lunch Time Water"
  Body: "Perfect timing! Another half bottle while you eat"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 6: Afternoon Energy (2:00 PM)

1. **Time of Day** → **2:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "⚡ Afternoon Energy Boost"
  Body: "Target: 1.5L by 3pm. Drink your full bottle now!"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 7: Late Afternoon (4:00 PM)

1. **Time of Day** → **4:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🌅 Late Afternoon Push"
  Body: "Energy slump? Dehydration causes fatigue. Full bottle please!"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 8: Evening Hydration (6:00 PM)

1. **Time of Day** → **6:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🌅 Evening Hydration - Final Push!"
  Body: "Last 500ml bottle! You're almost at your 2L goal!"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

#### Automation 9: Night Cap (8:00 PM)

1. **Time of Day** → **8:00 PM** → **Daily**
2. **Actions**:

```
Show Notification:
  Title: "🌙 Final Hydration"
  Body: "Small sips only - don't disrupt sleep. Just a bit from your bottle"

Wait: 2 seconds

Run Shortcut: "Log Water Amount"
```

---

## 🎮 Advanced Features

### Quick Log Widget Shortcut

Create a shortcut for instant logging from widgets:

1. **New Shortcut**: "Quick Water Log"
2. **Actions**:

```
Choose from Menu:
  Prompt: "How much did you drink?"
  Items: "Quarter bottle (125ml)", "Half bottle (250ml)", "Full bottle (500ml)", "Two bottles (1000ml)"

For each item:
  - Log Health Sample (appropriate amount)
  - Show notification with encouragement
```

3. **Add to Home Screen** as widget

### Progress Check Shortcut

1. **New Shortcut**: "Water Progress"
2. **Actions**:

```
Get Health Sample: Water, Today
Calculate: Total ml consumed
Calculate: Remaining = 2000 - Total
Calculate: Percentage = (Total / 2000) * 100

Show Notification:
  Title: "📊 Hydration Progress"
  Body: "Today: [Total]ml / 2000ml ([Percentage]%)
         Remaining: [Remaining]ml"
```

### Daily Reset Shortcut

1. **New Shortcut**: "Reset Water Goal"
2. **Actions**:

```
Show Notification:
  Title: "🔄 New Day, New Goal"
  Body: "Fresh start! Today's target: 2000ml (4 bottles)"

Set Low Power Mode: Off (optional energy boost)
```

3. **Automation**: Run at 12:00 AM daily

---

## 📱 Widget Setup

### Home Screen Widgets

1. **Shortcuts Widget**: Add "Quick Water Log" button
2. **Health Widget**: Show water intake for today
3. **Shortcuts Widget**: Add "Water Progress" button

### Lock Screen Widgets (iOS 16+)

1. **Long press lock screen** → **Customize**
2. **Add Widget** → **Shortcuts**
3. **Select**: "Quick Water Log" shortcut
4. **Position**: Below clock for easy access

---

## 🔔 Notification Optimization

### Make Notifications More Persistent

In **Settings → Notifications → Shortcuts**:
- **Allow Notifications**: On
- **Show Previews**: Always
- **Notification Grouping**: Off
- **Sounds**: Choose distinctive sound
- **Critical Alerts**: On (if available)

### Bypass Do Not Disturb

1. **Settings → Focus → Do Not Disturb**
2. **Apps**: Add Shortcuts to allowed apps
3. **Time Sensitive**: Allow time sensitive notifications

---

## ⚙️ Customization Options

### Different Bottle Size

If you have a different bottle size, modify:
1. **Menu items** in "Log Water Amount" shortcut
2. **Notification text** to match your bottle
3. **Health logging amounts**

Example for 750ml bottle:
- "Half bottle (375ml)"
- "Full bottle (750ml)"
- Adjust target to "3 bottles daily"

### Personalized Messages

Edit notification text to match your style:
- **Motivational**: "You're crushing it! 💪"
- **Casual**: "Water time! 💧"
- **Urgent**: "Hydration alert! ⚠️"
- **Fun**: "Glub glub time! 🐟"

### Add Habit Tracking

Connect to habit tracking apps:
1. **After logging water** → **Add to Streaks app**
2. **Daily goal reached** → **Complete "Hydration" in Habitify**
3. **Weekly streak** → **Reward yourself**

---

## 🚨 Troubleshooting

### Automations Not Running?
- **Settings → Screen Time → Content & Privacy → Automation** → Allow
- **Settings → Shortcuts** → Allow Running Scripts
- **Check Focus modes** - ensure Shortcuts is allowed

### Notifications Not Showing?
- **Restart iPhone** after setting up automations
- **Test manually** by running shortcuts directly
- **Check notification permissions** in Settings

### Health Data Not Logging?
- **Health app → Profile → Apps & Services → Shortcuts** → Turn on Water
- **Verify units** are set to ml in Health app

---

## 📊 Expected Daily Flow

| Time | Notification | Expected Action | Running Total |
|------|-------------|----------------|---------------|
| 7:30am | Wake up | Half bottle (250ml) | 250ml |
| 8:00am | Morning boost | Full bottle (500ml) | 750ml |
| 10:00am | Mid-morning | Full bottle (500ml) | 1250ml |
| 12:00pm | Pre-lunch | Half bottle (250ml) | 1500ml |
| 1:00pm | Lunch | Half bottle (250ml) | 1750ml |
| 2:00pm | Afternoon | Full bottle (500ml) | 2250ml |
| 4:00pm | Late afternoon | Skip or sips | 2250ml |
| 6:00pm | Evening | Skip or sips | 2250ml |
| 8:00pm | Night | Skip or sips | 2250ml |

**Result**: 2.25L achieved (exceeds 2L goal) ✅

---

## 🎯 Success Tips

1. **Place bottle by bedside** before sleep
2. **Always click notifications** - don't dismiss without action  
3. **Use 15-minute snooze** when genuinely busy
4. **Check progress widget** throughout day
5. **Celebrate reaching 2L** with the progress shortcut

This iOS setup replicates the persistent, zero-friction experience of the macOS version while leveraging native iPhone features!