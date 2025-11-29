# Esports App

A Flutter esports application with a modern dark theme UI.

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── constants/
│   ├── theme/           # Theme-related constants
│   │   ├── app_colors.dart
│   │   ├── app_spacing.dart
│   │   ├── app_typography.dart
│   │   └── app_dimensions.dart
│   ├── app_constants.dart  # Barrel file (exports all)
│   └── app_theme.dart      # Theme configuration
├── models/              # Data models
├── providers/           # State management (Provider pattern)
├── utils/               # Utility functions and helpers
├── widgets/             # Reusable UI components
└── main.dart            # App entry point
```

## Features

- Dark theme UI
- Player mode selection (Solo, Duo, Squad)
- Match browsing
- Game category selection
- Responsive design

## Tech Stack

- Flutter 3.24.0
- Provider (state management)
- flutter_svg (SVG support)

