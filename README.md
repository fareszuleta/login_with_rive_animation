# 🎨 Login with Rive Animation

A beautiful Flutter login screen featuring interactive Rive animations that bring your authentication UI to life! ✨

## 📱 Features

This application showcases the following functionalities:

- 🎭 **Interactive Rive Animation**: Engaging character animation that responds to user interactions
- 👤 **Username Input Field**: Email/username text field with email icon
- 🔐 **Password Input Field**: Secure password entry with lock icon
- 👁️ **Password Visibility Toggle**: Show/hide password functionality for better user experience
- 📐 **Responsive Design**: Adapts to different screen sizes using MediaQuery
- 🎨 **Modern UI**: Clean and modern interface with rounded corners and iconography

![Image](https://github.com/user-attachments/assets/2f117059-edb0-4e0b-834f-649875d9faf0)

## 🎬 What is Rive and State Machine?

### Rive
**Rive** is a powerful real-time interactive design and animation tool that allows designers and developers to create stunning vector animations. Unlike traditional animation formats, Rive animations are:
- 🎯 Interactive and responsive to user input
- 📦 Lightweight with small file sizes
- 🔄 Runtime-controllable through State Machines
- 🌐 Cross-platform compatible

### State Machine
A **State Machine** in Rive is a system that manages different animation states and transitions between them. It allows animations to:
- 🔀 Transition smoothly between different states (idle, success, fail, etc.)
- 🎮 Respond to user inputs and application events
- 🧩 Create complex interactive behaviors without writing complex animation code
- ⚡ Trigger specific animations based on conditions (like login success or error)

## 🛠️ Technologies

This project is built with:

- **Flutter** `^3.10.7` - Google's UI toolkit for building natively compiled applications
- **Dart** - Programming language optimized for building mobile, desktop, and web applications
- **Rive** `^0.13.20` - For creating and displaying interactive animations
- **Material Design** - Google's design system for creating beautiful UIs

## 📁 Project Structure

### Main Library Files

```
lib/
├── main.dart                    # App entry point and MaterialApp configuration
└── screens/
    └── login_screen.dart        # Login screen with Rive animation and input fields
```

### Key Files Description

- **`main.dart`**: Contains the `MyApp` widget which initializes the MaterialApp with theme configuration and sets `LoginScreen` as the home page.

- **`login_screen.dart`**: Implements the login UI with:
  - Rive animation integration
  - Username text field
  - Password text field with visibility toggle
  - Responsive layout using SafeArea and MediaQuery

### Assets

```
assets/
└── login_animation.riv          # Rive animation file for the login character
```

## 🎥 Demo

<!-- Add your GIF demo here -->
![Login Animation Demo](demo.gif)

> **Note**: Add a GIF demonstrating the complete functionality of the login screen with the Rive animation in action.

## 🎓 Academic Information

**Course**: [Your Course Name Here - e.g., Computer Graphics / Graficación]  
**Professor**: [Professor Name Here]  
**Institution**: [Your Institution Name]

## 🙏 Credits

Animation created by: [Animation Creator Name/Link Here]

<!-- Example:
Animation created by: [JcToon](https://rive.app/community/files/animation-link)
-->

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.10.7 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. Clone this repository
```bash
git clone [your-repo-url]
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

## 📄 License

This project is created for educational purposes.

---

Made with ❤️ using Flutter and Rive
