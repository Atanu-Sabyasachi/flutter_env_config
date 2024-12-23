/// Represents the configuration for a deployment process.
///
/// This class encapsulates details about a specific deployment, including its
/// ID, target environment, URL, server information, artifact name, and
/// rollback behavior. It provides methods for converting between JSON and
/// Dart objects for data persistence and serialization.
class DeploymentConfig {
  /// Creates a [DeploymentConfig] instance.
  ///
  /// All parameters are required:
  /// *   [deploymentId]: The unique identifier for the deployment.
  /// *   [environment]: The target environment for the deployment (e.g.,
  ///     "staging", "production").
  /// *   [url]: The URL of the deployed application.
  /// *   [server]: The server where the application is deployed.
  /// *   [artifactName]: The name of the deployment artifact.
  /// *   [rollbackOnFailure]: A boolean indicating whether to roll back the
  ///     deployment on failure.
  DeploymentConfig({
    required this.deploymentId,
    required this.environment,
    required this.url,
    required this.server,
    required this.artifactName,
    required this.rollbackOnFailure,
  });

  /// Creates a [DeploymentConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [DeploymentConfig] object. It expects the JSON map to contain the keys
  /// 'deploymentId', 'environment', 'url', 'server', 'artifactName', and
  /// 'rollbackOnFailure'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "deploymentId": "deploy-123",
  ///   "environment": "production",
  ///   "url": "[https://example.com](https://example.com)",
  ///   "server": "web-server-01",
  ///   "artifactName": "my-app-v1.0.0.zip",
  ///   "rollbackOnFailure": true
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory DeploymentConfig.fromJson(Map<String, dynamic> json) {
    return DeploymentConfig(
      deploymentId: json['deploymentId'] as String,
      environment: json['environment'] as String,
      url: json['url'] as String,
      server: json['server'] as String,
      artifactName: json['artifactName'] as String,
      rollbackOnFailure: json['rollbackOnFailure'] as bool,
    );
  }

  /// The unique identifier for the deployment.
  final String deploymentId;

  /// The target environment for the deployment (e.g., "staging", "production").
  final String environment;

  /// The URL of the deployed application.
  final String url;

  /// The server where the application is deployed.
  final String server;

  /// The name of the deployment artifact (e.g., a zip file or Docker image).
  final String artifactName;

  /// Whether to automatically roll back the deployment if it fails.
  ///
  /// If `true`, the deployment process will attempt to revert to the previous
  /// stable version in case of errors.
  final bool rollbackOnFailure;

  /// Converts this [DeploymentConfig] instance to a JSON map.
  ///
  /// This method serializes the [DeploymentConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'deploymentId', 'environment', 'url',
  /// 'server', 'artifactName', and 'rollbackOnFailure' keys and their
  /// corresponding values.
  Map<String, dynamic> toJson() => {
        'deploymentId': deploymentId,
        'environment': environment,
        'url': url,
        'server': server,
        'artifactName': artifactName,
        'rollbackOnFailure': rollbackOnFailure,
      };
}
