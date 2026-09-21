# 📱 FinJoy Mobile — Flutter Finance & Budget Application

<p align="center">
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Flutter-Dark.svg" height="45" alt="Flutter" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/tandpfun/skill-icons/main/icons/Dart-Dark.svg" height="45" alt="Dart" />
</p>

<p align="center">
  <strong>Sleek, responsive, and secure cross-platform personal finance mobile client built with Flutter, BLoC/Cubit, Hive caching, and Secure Storage.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-v3.11%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Version" />
  <img src="https://img.shields.io/badge/State%20Management-flutter__bloc-blueviolet?style=for-the-badge" alt="BLoC" />
  <img src="https://img.shields.io/badge/Local%20DB-Hive-FFD700?style=for-the-badge" alt="Hive" />
  <img src="https://img.shields.io/badge/Security-flutter__secure__storage-green?style=for-the-badge" alt="Security" />
</p>

---

## 📑 Overview

**FinJoy Mobile** is the client application of the FinJoy ecosystem. It delivers a fast, fluid, and intuitive user experience for recording day-to-day income and expenses, tracking category budgets with interactive progress indicators, and managing financial health on the go.

---

## 🚀 Key Highlights

- ⚡ **BLoC / Cubit Architecture**: Unidirectional data flow and reactive UI state management.
- 💾 **Offline-First & Fast Caching**: Powered by Hive for seamless local data caching and instant startup.
- 🔒 **Encrypted Token Management**: Hardware-backed credential and JWT handling via `flutter_secure_storage`.
- 🎨 **Dark Theme & Glassmorphism**: Polished UI with smooth animations, high-contrast palette, and clean typography.
- 📊 **Visual Financial Insights**: Dynamic balance calculations and category budget limit tracking.

---

## 📂 Architecture & Folder Layout

```text
lib/
├── core/
│   ├── constants/             # Design tokens, color schemes & strings
│   └── services/              # ApiService, HTTP clients & Secure Storage
├── data/
│   ├── models/                # Serializable data models (.g.dart)
│   └── repositories/          # Repository implementations for transactions & budgets
├── features/
│   ├── auth/                  # Login, Signup, AuthCubit & AuthRepository
│   ├── dashboard/             # Financial overview, Balance Card, Quick actions
│   ├── transactions/          # Add / Edit / List transactions & TransactionCubit
│   ├── budgets/               # Budget goals, spending bars & BudgetCubit
│   ├── settings/              # Profile, preferences, and secure logout
│   └── splash/                # Splash view with automated token verification
└── main.dart                  # Root app entry point & MultiBlocProvider setup
```

---

## 🛠️ Dependencies & Libraries

- **`flutter_bloc`**: Predictable state management across all feature cubits.
- **`hive` & `hive_flutter`**: High-performance local NoSQL database.
- **`flutter_secure_storage`**: Secure Keychain / Keystore storage for JWT auth tokens.
- **`http`**: Clean REST API networking client.
- **`json_annotation` & `json_serializable`**: Strong-typed JSON serialization.
- **`flutter_launcher_icons`**: Automated generation of native app icons.

---

## ⚙️ Getting Started

### 1. Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`^3.11.0` or higher)
- Android SDK / Android Studio or Xcode (for iOS)

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Model Adapters
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Configure Backend Endpoint
Open `lib/core/services/api_service.dart` and confirm your API host URL:
- **Android Emulator**: `http://10.0.2.2:5000/api`
- **iOS Simulator / Desktop**: `http://localhost:5000/api`
- **Real Device**: `http://<YOUR_LOCAL_IP>:5000/api`

### 5. Run the Application
```bash
# Debug mode
flutter run

# Release mode (Android APK)
flutter build apk --release
```

---

## 📄 License
Distributed under the **MIT License**.
