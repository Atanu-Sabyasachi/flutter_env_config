class DeploymentConfig {
  final String deploymentId;
  final String environment;
  final String url;
  final String server;
  final String artifactName;
  final bool rollbackOnFailure;

  DeploymentConfig({
    required this.deploymentId,
    required this.environment,
    required this.url,
    required this.server,
    required this.artifactName,
    required this.rollbackOnFailure,
  });

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

  Map<String, dynamic> toJson() => {
        'deploymentId': deploymentId,
        'environment': environment,
        'url': url,
        'server': server,
        'artifactName': artifactName,
        'rollbackOnFailure': rollbackOnFailure,
      };
}
