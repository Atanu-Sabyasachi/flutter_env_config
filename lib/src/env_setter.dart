import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/flutter_env_config.dart';

/// Sets the application's environment configuration.
///
/// This function loads the appropriate configuration file based on the
/// provided [environment]. It uses the [EnvironmentManager] to load the
/// configuration and make it available throughout the application.
///
/// Each environment (dev, staging, prod) should ideally have its own
/// configuration file (e.g., `dev_config.json`, `staging_config.json`,
/// `prod_config.json`) placed in the `assets` folder (or your configured asset
/// path).
///
/// Example usage:
///
/// ```dart
/// // In your main function (or before using any environment-specific data):
/// try {
///   await setEnvironment(Environment.dev); // Load the development environment config
///   runApp(MyApp());
/// } catch (e) {
///   // Handle loading errors, e.g., display an error message or exit the app.
///   print('Error setting environment: $e');
/// }
/// ```
///
/// Throws:
/// - [Exception] if there is an error loading the configuration file.
Future<void> setEnvironment(Environment environment) async {
  String configFilePath;
  switch (environment) {
    case Environment.dev:
      configFilePath = 'assets/dev_config.json';
      break;
    case Environment.staging:
      configFilePath = 'assets/staging_config.json';
      break;
    case Environment.prod:
      configFilePath = 'assets/prod_config.json';
      break;
  }

  try {
    // Load configuration from the selected environment's file.
    await EnvironmentManager().loadFromFile(
      configFilePath,
      format: 'json',
      targetEnvironment: environment,
    );
  } catch (e) {
    // Re-throw the exception to be handled by the caller. This is crucial for
    // proper error handling in the application startup.
    rethrow;
  }
}
