# 🎨 Login with Rive Animation

A beautiful Flutter login screen featuring interactive **Rive** animations that bring your authentication UI to life.

## 📱 Features

This application showcases the following functionalities:

- 🎭 **Interactive Rive Animation**: Character reacts to user actions using a Rive **State Machine**
- 👤 **Email / Username Input**: Text field with email icon
- 🔐 **Password Input**: Secure password field with lock icon
- 👁️ **Password Visibility Toggle**: Show/hide password
- ✅❌ **Login Success/Fail Feedback**: Fires `trigSuccess` / `trigFail` based on validation
- 🧠 **Look Tracking While Typing**: `numLook` changes with email length (debounced to neutral after typing)
- 🙈 **Hands Up on Password Focus**: `isHandsUp` toggles when typing password
- ⚠️ **Inline Validation Errors**: `errorText` shown for invalid email/password
- 📜 **Scrollable Layout**: Wrapped with `SingleChildScrollView` to avoid overflow on small screens
- 🎨 **Modern UI Extras**: “Forgot password?” and “Sign up” actions + styled login button
- 📐 **Responsive Design**: Uses `MediaQuery`
- 🧹 **Clean App UI**: `debugShowCheckedModeBanner: false`

## 🆕 Latest Updates (2026-03-10)

From commit `feat(login): add success/fail triggers with email and password regex validation`:

- Added **TextEditingControllers** for email and password
- Added **regex validation**:
  - Email: basic `name@domain.tld` validation
  - Password: minimum 8 chars with uppercase, lowercase, digit, and special character
- Added `_onLogin()` handler that:
  - updates UI errors (`emailError`, `passError`)
  - hides the keyboard and resets animation states
  - fires success/fail triggers based on validation result
- Added UI elements: **Login** button, **Forgot password?**, and **Sign up** row

## 🎬 What is Rive and a State Machine?

### Rive

**Rive** is a real-time interactive design and animation tool for creating vector animations that are:

- 🎯 Interactive and responsive to user input
- 📦 Lightweight with small file sizes
- 🔄 Runtime-controllable through **State Machines**
- 🌐 Cross-platform compatible

### State Machine

A **State Machine** in Rive manages animation states and transitions. In this project it is used to:

- 🔀 Transition between states such as idle, success, and fail
- 🎮 Respond to text input and focus events (checking, hands up)
- ⚡ Trigger specific animations based on login validation

## 🛠️ Technologies

This project is built with:

- **Flutter** `^3.10.7`
- **Dart**
- **Rive** `^0.13.20`
- **Material Design**

## 📁 Project Structure

```text
lib/
├── main.dart                    # App entry point / MaterialApp configuration
└── screens/
    └── login_screen.dart        # Login screen with Rive animation and form UI
```

## 🎥 Demo

![Image](https://github.com/user-attachments/assets/2f117059-edb0-4e0b-834f-649875d9faf0)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.10.7 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone this repository

```bash
git clone https://github.com/fareszuleta/login_with_rive_animation.git
```

2. Navigate to the project directory

```bash
cd login_with_rive_animation
```

3. Install dependencies

```bash
flutter pub get
```

4. Run the application

```bash
flutter run
```

## 🙏 Credits

- Rive animation: *(add author / link here)*

## 📄 License

This project is created for educational purposes.

---

Made with Flutter and Rive