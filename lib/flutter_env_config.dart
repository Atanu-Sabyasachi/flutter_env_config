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

/// A utility class for initializing and managing environment configurations
///
/// The [FlutterEnvConfig] class acts as an entry point to configure the application
/// with the environment-specific settings defined in JSON or YAML files.
/// It uses the `EnvironmentManager` to load and manage configurations.
class FlutterEnvConfig {
  /// Initializes the environment configuration.
  ///
  /// This method loads the environment configuration from the specified file
  /// and sets the target environment. It is typically called during the app's
  /// initialization phase.
  ///
  /// - [configFile]: The path to the configuration file (e.g., `assets/config.json`).
  /// - [targetEnvironment]: The target environment to load (e.g., `Environment.dev`).
  ///
  /// Throws an error if the configuration fails to load.
  static Future<void> init({
    required String configFile,
    required Environment targetEnvironment,
  }) async {
    try {
      // Loads environment configuration using the EnvironmentManager.
      await EnvironmentManager().loadFromFile(
        configFile,
        targetEnvironment: targetEnvironment,
      );
    } catch (e) {
      // Logs any error encountered during initialization.
      log('Error initializing environment: $e');
      rethrow;
    }
  }
}
