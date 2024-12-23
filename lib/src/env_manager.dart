import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/flutter_env_config.dart';
import 'package:flutter_env_config/models/analytics_config.dart';
import 'package:flutter_env_config/models/api_config.dart';
import 'package:flutter_env_config/models/ci_cd/build_config.dart';
import 'package:flutter_env_config/models/ci_cd/ci_cd_config.dart';
import 'package:flutter_env_config/models/ci_cd/deployment_config.dart';
import 'package:flutter_env_config/models/ci_cd/testing_config.dart';
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

/// Singleton manager for handling environment-specific configurations.
///
/// The `EnvironmentManager` class allows you to load configurations from files
/// (JSON/YAML), manage the current environment, and observe changes to the
/// configuration in real time using [ValueNotifier].
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
  ValueNotifier<EnvironmentConfig> get currentConfigNotifier =>
      _currentConfigNotifier;

  /// Static getter for accessing environment data directly.
  static EnvironmentConfig get environmentData =>
      _instance._currentConfigNotifier.value;

  /// Loads environment configuration from a file.
  ///
  /// - [path]: Relative path to the configuration file.
  /// - [format]: Format of the configuration file (`json` or `yaml`).
  ///   Defaults to `json`.
  /// - [targetEnvironment]: The environment to load, such as `dev`, `staging`,
  ///   or `prod`.
  ///
  /// Throws:
  /// - Exception if the file content cannot be parsed.
  /// - Exception if the configuration for the specified environment is not found.
  Future<void> loadFromFile(
    String path, {
    String format = 'json',
    required Environment targetEnvironment,
  }) async {
    try {
      // Load the file content
      final fileContent = await root_bundle.rootBundle.loadString(path);
      log('Loaded file content: $fileContent');

      // Parse the configuration file
      final parsedConfig = EnvParser.parse(fileContent, format: format);
      log('Parsed configuration: $parsedConfig');

      // Extract the environment-specific configuration
      final environmentConfig =
          parsedConfig[targetEnvironment.name.toLowerCase()];

      if (environmentConfig == null) {
        throw Exception(
            'Environment configuration for ${targetEnvironment.name} not found');
      }

      // Update the notifier with the new configuration
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
  void loadFromJson(Map<String, dynamic> json) {
    _currentConfigNotifier.value = EnvironmentConfig.fromJson(json);
  }
}
