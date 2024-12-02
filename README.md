# Realtime Object Detection

Object Detection and Speech to Text

## Features

- This Flutter application provides two primary features:
    1. **Object Detection**: Detects objects in real-time using TensorFlow Lite models.
        - Real-time object detection with a live camera feed.
    2. **Speech to Text**: Converts spoken words into text using the `speech_to_text` package.
        - Accurate and fast speech recognition for transcribing user input.

## Setup Instructions

### Prerequisites

- This project is powered by Flutter **3.22.3** and Dart **3.4.4**.

To be able to run the code you have to either install the Flutter SDK ([Get Flutter](https://flutter.dev/docs/get-started/install)) or to select and install a specific version of flutter using FVM ([fvm.app](https://fvm.app))

- The main packages used in the project:

```yaml
dependencies:
  tflite_v2: ^1.0.0
  camera: ^0.11.0+2
  speech_to_text: ^7.0.0
  flutter_bloc: ^8.1.6
  bloc: ^8.1.4
```

### Installation

```bash
git clone https://github.com/raghebzaki/object-detection-realtime-flutter.git # To clone the repo
cd yourprojectname # To go to the project directory
flutter  pub  get  # To get dependencies
```

### Running the App

The minimum set of commands & instructions required to run project on different platforms (Android, iOS, web).

```bash
flutter pub  run  build_runner  build  --delete-conflicting-outputs  # To generate Freezed models
flutter run # To run on Android
flutter run # To run on iOS (requires a Mac)
flutter run -d chrome # To run on web
```

## Building the App

To build the project, you can use `Android Studio` or `Visual Studio Code` with Flutter/Dart plugins (`Dart`, `Flutter`), then the commands above will be executed automatically when building and running.

To build from console:

```bash
flutter  build  ios  --release
# or
flutter  build  android  --release
```

``lib/main.dart`` - this is the main launch point of the project
