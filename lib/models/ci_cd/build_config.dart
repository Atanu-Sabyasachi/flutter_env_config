class BuildConfig {
  final String buildId;
  final String branchName;
  final String commitHash;

  BuildConfig(
      {required this.buildId,
      required this.branchName,
      required this.commitHash});

  factory BuildConfig.fromJson(Map<String, dynamic> json) {
    return BuildConfig(
      buildId: json['buildId'] as String,
      branchName: json['branchName'] as String,
      commitHash: json['commitHash'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'buildId': buildId,
        'branchName': branchName,
        'commitHash': commitHash,
      };
}
