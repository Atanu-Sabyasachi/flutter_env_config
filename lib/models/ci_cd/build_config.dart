/// Represents build-specific information.
///
/// This class encapsulates details about a specific build, including its ID,
/// the branch it was built from, and the commit hash. It provides methods
/// for converting between JSON and Dart objects for data persistence and
/// serialization.
class BuildConfig {
  /// Creates a [BuildConfig] instance.
  ///
  /// The [buildId], [branchName], and [commitHash] parameters are required
  /// and must be provided.
  BuildConfig({
    required this.buildId,
    required this.branchName,
    required this.commitHash,
  });

  /// Creates a [BuildConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [BuildConfig] object. It expects the JSON map to contain the keys
  /// 'buildId', 'branchName', and 'commitHash'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "buildId": "12345",
  ///   "branchName": "main",
  ///   "commitHash": "a1b2c3d4e5f6"
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory BuildConfig.fromJson(Map<String, dynamic> json) {
    return BuildConfig(
      buildId: json['buildId'] as String,
      branchName: json['branchName'] as String,
      commitHash: json['commitHash'] as String,
    );
  }

  /// The unique identifier for the build.
  ///
  /// This ID is typically generated by the build system.
  final String buildId;

  /// The name of the branch the build was created from.
  ///
  /// For example, "main", "develop", or a feature branch name.
  final String branchName;

  /// The commit hash associated with the build.
  ///
  /// This hash uniquely identifies the specific commit that was built.
  final String commitHash;

  /// Converts this [BuildConfig] instance to a JSON map.
  ///
  /// This method serializes the [BuildConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'buildId', 'branchName', and
  /// 'commitHash' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'buildId': buildId,
        'branchName': branchName,
        'commitHash': commitHash,
      };
}
