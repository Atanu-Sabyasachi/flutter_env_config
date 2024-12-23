import 'package:flutter_env_config/models/ci_cd/build_config.dart';
import 'package:flutter_env_config/models/ci_cd/deployment_config.dart';
import 'package:flutter_env_config/models/ci_cd/testing_config.dart';

/// Represents the complete configuration for CI/CD pipelines.
///
/// This class combines various aspects of a CI/CD configuration, including
/// environment variables, build-specific details, deployment settings, and
/// testing configurations. It provides methods for constructing instances
/// from JSON and converting them back for data persistence and serialization.
class CiCdConfig {
  /// A map containing environment variables for the CI/CD pipeline.
  ///
  /// These variables can be used to configure various aspects of the pipeline
  /// such as API endpoints, database connections, or feature flags.
  final Map<String, String> variables;

  /// Configuration information specific to the build process.
  ///
  /// This includes details like the build ID, the branch it was built from,
  /// and the commit hash.
  final BuildConfig build;

  /// Configuration settings for deployment environments.
  ///
  /// This section can define aspects like target environments (e.g., staging,
  /// production), API URLs, and deployment strategies.
  final DeploymentConfig deployment;

  /// Configuration settings for the testing phase of the pipeline.
  ///
  /// This can include details about test coverage thresholds, test runners,
  /// and code analysis tools.
  final TestingConfig testing;

  /// Creates a [CiCdConfig] instance.
  ///
  /// All parameters are required:
  ///  * [variables]: A map containing environment variables.
  ///  * [build]: Build configuration information.
  ///  * [deployment]: Deployment configuration settings.
  ///  * [testing]: Testing configuration settings.
  CiCdConfig({
    required this.variables,
    required this.build,
    required this.deployment,
    required this.testing,
  });

  /// Creates a [CiCdConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [CiCdConfig] object. It expects the JSON map to contain the keys
  /// 'variables', 'build', 'deployment', and 'testing', each containing
  /// appropriate data for their respective configurations.
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory CiCdConfig.fromJson(Map<String, dynamic> json) {
    return CiCdConfig(
      variables: Map<String, String>.from(json['variables']),
      build: BuildConfig.fromJson(json['build']),
      deployment: DeploymentConfig.fromJson(json['deployment']),
      testing: TestingConfig.fromJson(json['testing']),
    );
  }

  /// Converts this [CiCdConfig] instance to a JSON map.
  ///
  /// This method serializes the [CiCdConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'variables', 'build', 'deployment',
  /// and 'testing' keys with their corresponding configurations in JSON format.
  Map<String, dynamic> toJson() => {
        'variables': variables,
        'build': build.toJson(),
        'deployment': deployment.toJson(),
        'testing': testing.toJson(),
      };
}
