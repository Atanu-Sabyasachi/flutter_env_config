import 'package:flutter_env_config/models/ci_cd/build_config.dart';
import 'package:flutter_env_config/models/ci_cd/deployment_config.dart';
import 'package:flutter_env_config/models/ci_cd/testing_config.dart';

class CiCdConfig {
  final Map<String, String> variables;
  final BuildConfig build;
  final DeploymentConfig deployment;
  final TestingConfig testing;

  CiCdConfig({
    required this.variables,
    required this.build,
    required this.deployment,
    required this.testing,
  });

  factory CiCdConfig.fromJson(Map<String, dynamic> json) {
    return CiCdConfig(
      variables: Map<String, String>.from(json['variables']),
      build: BuildConfig.fromJson(json['build']),
      deployment: DeploymentConfig.fromJson(json['deployment']),
      testing: TestingConfig.fromJson(json['testing']),
    );
  }

  Map<String, dynamic> toJson() => {
        'variables': variables,
        'build': build.toJson(),
        'deployment': deployment.toJson(),
        'testing': testing.toJson(),
      };
}
