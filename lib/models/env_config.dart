import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/models/analytics_config.dart';
import 'package:flutter_env_config/models/api_config.dart';
import 'package:flutter_env_config/models/ci_cd/ci_cd_config.dart';
import 'package:flutter_env_config/models/features_config.dart';
import 'package:flutter_env_config/models/localization_config.dart';
import 'package:flutter_env_config/models/logging_config.dart';
import 'package:flutter_env_config/models/scheduled_tasks_config.dart';
import 'package:flutter_env_config/models/security_config.dart';
import 'package:flutter_env_config/models/theming_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/third_party_services_config.dart';

class EnvironmentConfig {
  final Environment environment; // Necessary for every developer
  final String name; // Necessary for every developer
  final ApiConfig?
      api; // Nullable, not all configurations might require API details
  final CiCdConfig?
      ciCd; // Nullable, CI/CD config may not be needed in all environments
  final FeaturesConfig?
      features; // Nullable, feature flags might be environment-specific
  final LoggingConfig? logging; // Nullable, logging settings can be optional
  final SecurityConfig?
      security; // Nullable, security settings might be optional
  final AnalyticsConfig?
      analytics; // Nullable, analytics may not be enabled in all environments
  final LocalizationConfig?
      localization; // Nullable, localization config may vary
  final ThemingConfig? theming; // Nullable, theming might be optional
  final ThirdPartyServicesConfig?
      thirdPartyServices; // Nullable, third-party service settings might be environment-dependent
  final ScheduledTasksConfig?
      scheduledTasks; // Nullable, scheduled tasks might not be relevant in every environment

  EnvironmentConfig({
    required this.environment,
    required this.name,
    this.api,
    this.ciCd,
    this.features,
    this.logging,
    this.security,
    this.analytics,
    this.localization,
    this.theming,
    this.thirdPartyServices,
    this.scheduledTasks,
  });

  factory EnvironmentConfig.fromJson(Map<String, dynamic> json) {
    return EnvironmentConfig(
      environment: _fromString(json['environment']),
      name: json['name'] as String,
      api: json['api'] != null ? ApiConfig.fromJson(json['api']) : null,
      ciCd: json['ciCd'] != null ? CiCdConfig.fromJson(json['ciCd']) : null,
      features: json['features'] != null
          ? FeaturesConfig.fromJson(json['features'])
          : null,
      logging: json['logging'] != null
          ? LoggingConfig.fromJson(json['logging'])
          : null,
      security: json['security'] != null
          ? SecurityConfig.fromJson(json['security'])
          : null,
      analytics: json['analytics'] != null
          ? AnalyticsConfig.fromJson(json['analytics'])
          : null,
      localization: json['localization'] != null
          ? LocalizationConfig.fromJson(json['localization'])
          : null,
      theming: json['theming'] != null
          ? ThemingConfig.fromJson(json['theming'])
          : null,
      thirdPartyServices: json['thirdPartyServices'] != null
          ? ThirdPartyServicesConfig.fromJson(json['thirdPartyServices'])
          : null,
      scheduledTasks: json['scheduledTasks'] != null
          ? ScheduledTasksConfig.fromJson(json['scheduledTasks'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'environment': environment.toString().split('.').last,
        'name': name,
        'api': api?.toJson(),
        'ciCd': ciCd?.toJson(),
        'features': features?.toJson(),
        'logging': logging?.toJson(),
        'security': security?.toJson(),
        'analytics': analytics?.toJson(),
        'localization': localization?.toJson(),
        'theming': theming?.toJson(),
        'thirdPartyServices': thirdPartyServices?.toJson(),
        'scheduledTasks': scheduledTasks?.toJson(),
      };

  static Environment _fromString(String environment) {
    switch (environment.toLowerCase()) {
      case 'dev':
        return Environment.dev;
      case 'staging':
        return Environment.staging;
      case 'prod':
        return Environment.prod;
      default:
        throw Exception('Unknown environment: $environment');
    }
  }
}
