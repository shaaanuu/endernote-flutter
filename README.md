# EnderNote

Welcome to EnderNote! 🚀 EnderNote is a sleek and powerful note-taking application designed to boost your productivity. Built with Flutter, EnderNote provides a seamless and efficient note-taking experience.

## Features

- ⚡ **Lightning Fast**: Utilizes Flutter for smooth performance and quick load times.
- 📝 **Markdown Support**: Write notes in Markdown with live preview.
- 🔍 **Full-Text Search**: Quickly find your notes with robust search functionality (coming soon).
- 📁 **Organized Folders**: Organize your notes into folders for better management (coming soon).
- ☁️ **Cloud Sync**: Sync your notes across devices (coming soon).

## Getting Started

### Prerequisites

- Flutter (v2+ recommended)
- Dart (v2.12+)
- Firebase Project with Firestore and Authentication enabled

### Installation

#### Clone the repository:

```bash
git clone https://github.com/shaaanuu/endernote-flutter.git
cd endernote-flutter
```

#### Install dependencies:

```bash
flutter pub get
```

#### Set up Firebase:

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Add Firebase to your Flutter app by following the setup instructions [Firebase Flutter documentation](https://firebase.flutter.dev/docs/overview).
3. Create a new file called `api_key.dart` in the lib folder and add your Firebase web API key:

```dart
const firebaseWebApi = "blablablaa";
```

#### Start the development server:

```bash
flutter run
```

## Contributing

We welcome contributions! Please see our [CONTRIBUTING.md](https://github.com/shaaanuu/endernote-flutter/blob/main/CONTRIBUTING.md) for details on how to get started.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/shaaanuu/endernote-flutter/blob/main/LICENSE) file for details.

## Acknowledgements

- Inspired by [Obsidian](https://obsidian.md/).
- Powered by [Flutter](https://flutter.dev/).
- Backend by [Firebase](https://firebase.google.com/docs).
