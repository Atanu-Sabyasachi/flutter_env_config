<a href="https://www.buymeacoffee.com/AtanuSabyasachi"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=AtanuSabyasachi&button_colour=FFDD00&font_colour=000000&font_family=Poppins&outline_colour=000000&coffee_colour=ffffff" />
</a>

# Flutter Env Config Manager

A powerful and flexible environment configuration management package for Flutter projects. This package simplifies managing and switching between multiple environment configurations (e.g., `dev`, `staging`, `prod`) and allows runtime updates, making it ideal for scalable applications.

## Features

- Load environment configurations from JSON or YAML files.
- Dynamic configuration updates at runtime using `ValueNotifier`.
- Centralized environment management with a singleton pattern.
- Supports CI/CD configurations, API settings, theming, analytics, and more.
- Easy-to-use methods for testing and environment overrides.

## Installation

Add the following line to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_env_config: <version>
```
Run
```
flutter pub get
```

## Usage
Import the Package
```
import 'package:flutter_env_config/flutter_env_config.dart';
```