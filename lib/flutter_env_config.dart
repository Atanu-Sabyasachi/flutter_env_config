// Exports the core manager for environment configurations.
export 'src/env_manager.dart';

// Defines the data model for environment configurations.
export 'models/env_config.dart';

// Handles parsing of JSON/YAML configuration files.
export 'src/env_parser.dart';

// Provides methods to set and load environments.
export 'src/env_setter.dart';

import 'dart:developer';

import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/flutter_env_config.dart';

/// A central class for managing environment configurations in your Flutter application.
///
/// The `FlutterEnvConfig` class provides a simplified interface for initializing
/// and working with environment-specific settings. It encapsulates the
/// functionalities of loading configurations from JSON or YAML files, setting the
/// target environment, and managing the configuration data throughout your app.
///
/// This class offers a convenient way to centralize your environment configuration
/// logic and ensure consistent access to environment-specific values across your
/// application.
class FlutterEnvConfig {
  /// Initializes the environment configuration for your application.
  ///
  /// This method is typically called during the application's initialization
  /// phase. It performs the following steps:
  ///
  /// 1. Loads the configuration data from the specified file path
  ///    (e.g., `assets/config.json`).
  /// 2. Sets the target environment based on the provided [targetEnvironment]
  ///    enum value (e.g., `Environment.dev`).
  ///
  /// This method throws an exception if any errors occur during the
  /// configuration loading process.
  ///
  /// - [configFile]: The path to the configuration file for your chosen format
  ///                 (JSON or YAML).
  /// - [targetEnvironment]: The target environment to load (e.g., `Environment.dev`).
  static Future<void> init({
    required String configFile,
    required Environment targetEnvironment,
  }) async {
    try {
      // Load environment configuration using EnvironmentManager.
      await EnvironmentManager().loadFromFile(
        configFile,
        targetEnvironment: targetEnvironment,
      );
    } catch (e) {
      // Log any errors encountered during initialization for debugging purposes.
      log('Error initializing environment: $e');
      rethrow; // Re-throw the exception for proper error handling.
    }
  }
}
