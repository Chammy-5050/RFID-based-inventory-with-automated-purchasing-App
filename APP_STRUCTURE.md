# RFID Inventory App - Structure & Navigation Guide

## App Flow Overview

```
Splash Screen
    ↓
Login Screen ←→ Register Screen
    ↓
Home Screen (Dashboard)
    ├→ Scanner Screen
    ├→ Receive Inventory Screen
    ├→ Transfer Inventory Screen
    └→ Notification Screen
```

## Pages Implemented

### 1. **Splash Screen** (`Splash_screen.dart`)
- Entry point of the application
- Displays app logo and description
- "Get Started" button navigates to Login Screen

### 2. **Login Screen** (`login_screen.dart`)
- User authentication interface
- Email and password input fields
- "Keep me signed in" checkbox
- Navigation links:
  - **LOGIN button** → Home Screen
  - **Sign Up link** → Register Screen

### 3. **Register Screen** (`register_screen.dart`)
- New user registration form
- Fields: Username, Email, Password, Confirm Password
- Navigation links:
  - **Sign Up button** → Home Screen
  - **Sign In link** → Login Screen

### 4. **Home Screen** (`home_screen.dart`)
- **Main dashboard** after successful login
- Features:
  - Top navigation bar with logout option
  - Bottom navigation bar (5 tabs)
  - Dashboard with quick stats cards
  - Quick action buttons for common tasks
  - Recent activity feed
  - Navigation between all major screens

### 5. **Scanner Screen** (`Scanner_screen.dart`)
- RFID barcode scanning interface
- Features:
  - Manual barcode input field
  - Add/remove items from scanned list
  - Clear all functionality
  - Submit scanned items button
  - List of scanned items with timestamps

### 6. **Receive Inventory Screen** (`Reveive_inventory.dart`)
- Add new stock to inventory
- Features:
  - Input fields: SKU/Product ID, Quantity, Supplier Name
  - Add items to received list
  - Remove individual items
  - Clear all functionality
  - Confirm receipt button

### 7. **Transfer Inventory Screen** (`Transfer_inventory.dart`)
- Move items between locations
- Features:
  - Input fields: SKU, Quantity
  - Dropdown selectors for from/to locations
  - Available locations: Warehouse A, B, Store 1, Store 2, Stock Room
  - Create transfer functionality
  - Confirm/complete transfer status
  - Remove transfers

### 8. **Notification Screen** (`notification_screen.dart`)
- Display system alerts and updates
- Features:
  - Notification list with timestamps
  - Unread notification counter
  - Mark as read functionality
  - Delete individual notifications
  - Clear all notifications
  - Different notification types with color coding

---

## Bottom Navigation Bar

All screens accessible via bottom navigation with 5 tabs:

| Icon | Label | Screen |
|------|-------|--------|
| 🏠 | Home | Dashboard Page |
| 📱 | Scanner | RFID Scanner |
| 📦 | Receive | Receive Inventory |
| ✈️ | Transfer | Transfer Inventory |
| 🔔 | Notifications | Notification Screen |

---

## Color Scheme

- **Primary Color**: Amber/Gold (Accent)
- **Secondary Colors**:
  - Blue: Information/General actions
  - Green: Success/Receive operations
  - Purple: Transfer operations
  - Orange: Warnings/Alerts
  - Red: Critical alerts/Pending items

---

## Key Features

✅ **Proper Navigation**: All pages linked with functional navigation buttons
✅ **Consistent UI**: Unified color scheme and design patterns
✅ **Bottom Navigation**: Easy access to all major features
✅ **Logout Functionality**: Logout button in app bar returns to Login Screen
✅ **Data Management**: Add, remove, and manage items across all screens
✅ **User Feedback**: SnackBar notifications for user actions

---

## How to Run

1. Ensure Flutter is installed
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app
4. App starts at Splash Screen
5. Click "Get Started" → Login/Register → Access Home Screen

---

## File Structure

```
lib/
├── main.dart                      (App entry point)
├── Core/
│   └── API_client.dart           (API integration)
└── pages/
    ├── Splash_screen.dart         ✅ Implemented
    ├── login_screen.dart          ✅ Implemented with navigation
    ├── register_screen.dart       ✅ Implemented with navigation
    ├── home_screen.dart           ✅ Implemented (Main Dashboard)
    ├── Scanner_screen.dart        ✅ Implemented
    ├── Reveive_inventory.dart     ✅ Implemented
    ├── Transfer_inventory.dart    ✅ Implemented
    └── notification_screen.dart   ✅ Implemented
```

---

## Navigation Summary

- **Splash → Login**: Auto-navigate on "Get Started"
- **Login ↔ Register**: Switch between login and signup
- **Login/Register → Home**: After successful authentication
- **Home ↔ All Screens**: Via bottom navigation bar
- **Home → Login**: Via logout in app bar
- **Dashboard Cards**: Quick action buttons navigate to respective screens

All pages are now properly connected and functional! 🎉
