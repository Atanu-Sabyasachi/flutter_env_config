import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/models/analytics_config.dart';
import 'package:flutter_env_config/models/api_config.dart';
import 'package:flutter_env_config/models/ci_cd/build_config.dart';
import 'package:flutter_env_config/models/ci_cd/ci_cd_config.dart';
import 'package:flutter_env_config/models/ci_cd/deployment_config.dart';
import 'package:flutter_env_config/models/ci_cd/testing_config.dart';
import 'package:flutter_env_config/models/env_config.dart';
import 'package:flutter_env_config/models/features_config.dart';
import 'package:flutter_env_config/models/localization_config.dart';
import 'package:flutter_env_config/models/logging_config.dart';
import 'package:flutter_env_config/models/scheduled_tasks_config.dart';
import 'package:flutter_env_config/models/security_config.dart';
import 'package:flutter_env_config/models/theming_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/firebase_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/razor_pay_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/stripe_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/third_party_services_config.dart';
import 'package:flutter_env_config/src/env_parser.dart';
// ... other imports

/// Singleton manager for handling environment-specific configurations.
///
/// The `EnvironmentManager` class allows you to load configurations from files
/// (JSON/YAML), manage the current environment, and observe changes to the
/// configuration in real time using [ValueNotifier].
///
/// Example usage:
///
/// ```dart
/// // Initialize the environment manager (usually in your main function).
/// await EnvironmentManager().loadFromFile(
///   'assets/config/env_config.json',
///   targetEnvironment: Environment.dev,
/// );
///
/// // Access configuration data.
/// final baseUrl = EnvironmentManager.environmentData.api.baseUrl;
///
/// // Listen for configuration changes.
/// EnvironmentManager().currentConfigNotifier.addListener(() {
///   final currentConfig = EnvironmentManager().currentConfig;
///   // Update UI or perform other actions based on the new configuration.
///   print('New base URL: ${currentConfig.api.baseUrl}');
/// });
/// ```
class EnvironmentManager {
  /// Factory constructor to ensure a single instance.
  factory EnvironmentManager() => _instance;

  EnvironmentManager._internal();

  static final EnvironmentManager _instance = EnvironmentManager._internal();

  /// Internal notifier for the current environment configuration.
  final ValueNotifier<EnvironmentConfig> _currentConfigNotifier = ValueNotifier(
    EnvironmentConfig(
      environment: Environment.dev, // Default to dev environment
      name: '', // Placeholder name
      api: ApiConfig(
        baseUrl: '', // Default API base URL
        timeout: 30000, // Default timeout in milliseconds
      ),
      ciCd: CiCdConfig(
        variables: {},
        build: BuildConfig(
          buildId: '',
          branchName: '',
          commitHash: '',
        ),
        deployment: DeploymentConfig(
          deploymentId: '',
          environment: '',
          url: '',
          artifactName: '',
          rollbackOnFailure: false,
          server: '',
        ),
        testing: TestingConfig(
          testingFramework: '',
          enableUnitTests: false,
          enableIntegrationTests: false,
          enableE2ETests: false,
          coverageThreshold: 70,
          runUnitTests: false,
        ),
      ),
      features: FeaturesConfig(
        enableBetaFeatures: true,
        featureFlag: true,
        featureOneEnabled: null,
        featureTwoEnabled: null,
      ),
      logging: LoggingConfig(
        logLevel: 'debug',
        enableLogging: true,
      ),
      security: SecurityConfig(
        enableEncryption: true,
        encryptionKey: '',
        enableSecureStorage: true,
        sslPinning: false,
      ),
      analytics: AnalyticsConfig(
        enableAnalytics: true,
        apiKey: '',
        enableTracking: true,
      ),
      localization: LocalizationConfig(
        defaultLocale: 'en',
        supportedLocales: ['en', 'fr', 'es'],
      ),
      theming: ThemingConfig(
        primaryColor: '#FF5733',
        secondaryColor: '#33FF57',
        fontFamily: 'Roboto',
      ),
      thirdPartyServices: ThirdPartyServicesConfig(
        firebaseConfig: FirebaseConfig(
          apiKey: '',
          projectId: '',
          appId: '',
          messagingSenderId: '',
          storageBucket: '',
          authDomain: '',
          measurementId: '',
        ),
        enablePaymentGateway: true,
        enableAnalyticsIntegration: true,
        razorpayConfig: RazorpayConfig(
          apiKey: '',
          secretKey: '',
        ),
        stripeConfig: StripeConfig(
          publishableKey: '',
          secretKey: '',
        ),
      ),
      scheduledTasks: ScheduledTasksConfig(
        tasks: [],
        syncInterval: 300,
        cleanupInterval: 600,
      ),
    ),
  );

  /// Current environment configuration.
  EnvironmentConfig get currentConfig => _currentConfigNotifier.value;

  /// Observable configuration notifier.
  ///
  /// Listen to this notifier to be notified of changes to the environment
  /// configuration.
  ///
  /// Example:
  /// ```dart
  /// EnvironmentManager().currentConfigNotifier.addListener(() {
  ///   final currentConfig = EnvironmentManager().currentConfig;
  ///   print('New base URL: ${currentConfig.api.baseUrl}');
  /// });
  /// ```
  ValueNotifier<EnvironmentConfig> get currentConfigNotifier =>
      _currentConfigNotifier;

  /// Static getter for accessing environment data directly.
  ///
  /// This provides a convenient way to access configuration values without
  /// needing to use the notifier. However, it will not reflect real-time
  /// changes to the configuration.
  ///
  /// Example:
  /// ```dart
  /// final baseUrl = EnvironmentManager.environmentData.api.baseUrl;
  /// ```
  static EnvironmentConfig get environmentData =>
      _instance._currentConfigNotifier.value;

  /// Loads environment configuration from a file.
  ///
  /// - [path]: Relative path to the configuration file (e.g.,
  ///   'assets/config/env_config.json').
  /// - [format]: Format of the configuration file (`json` or `yaml`).
  ///   Defaults to `json`.
  /// - [targetEnvironment]: The environment to load (e.g., `Environment.dev`,
  ///   `Environment.staging`, `Environment.prod`).
  ///
  /// Example usage:
  ///
  /// ```dart
  /// await EnvironmentManager().loadFromFile(
  ///   'assets/config/env_config.json',
  ///   targetEnvironment: Environment.dev,
  /// );
  /// ```
  ///
  /// Throws:
  /// - [Exception] if the file content cannot be parsed.
  /// - [Exception] if the configuration for the specified environment is not
  ///   found.
  Future<void> loadFromFile(
    String path, {
    String format = 'json',
    required Environment targetEnvironment,
  }) async {
    try {
      final fileContent = await root_bundle.rootBundle.loadString(path);
      log('Loaded file content: $fileContent');

      final parsedConfig = EnvParser.parse(fileContent, format: format);
      log('Parsed configuration: $parsedConfig');

      final environmentConfig =
          parsedConfig[targetEnvironment.name.toLowerCase()];

      if (environmentConfig == null) {
        throw Exception(
            'Environment configuration for ${targetEnvironment.name} not found');
      }

      _currentConfigNotifier.value =
          EnvironmentConfig.fromJson(environmentConfig as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to load environment configuration: $e');
    }
  }

  /// Sets environment configuration directly from a Map.
  ///
  /// This method is particularly useful for testing purposes or dynamically
  /// updating configuration at runtime.
  ///
  /// - [json]: A Map representing the environment configuration.
  ///
  /// Example:
  /// ```dart
  /// final configMap = {
  ///   "api": {"baseUrl": "[invalid URL removed]", "timeout": 5000},
  ///   "features": {"featureOneEnabled": false}
  /// };
  /// EnvironmentManager().loadFromJson(configMap);
  /// ```
  void loadFromJson(Map<String, dynamic> json) {
    _currentConfigNotifier.value = EnvironmentConfig.fromJson(json);
  }
}
