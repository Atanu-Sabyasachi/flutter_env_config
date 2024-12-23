/// Represents the configuration for testing within a CI/CD pipeline.
///
/// This class encapsulates settings related to testing, including the testing
/// framework used, the enabling and running of different types of tests
/// (unit, integration, and end-to-end), and the code coverage threshold. It
/// provides methods for converting between JSON and Dart objects for data
/// persistence and serialization.
class TestingConfig {
  /// Creates a [TestingConfig] instance.
  ///
  /// All parameters are required:
  /// *   [testingFramework]: The name of the testing framework used (e.g.,
  ///     "flutter_test", "jest").
  /// *   [enableUnitTests]: Whether unit tests are enabled.
  /// *   [enableIntegrationTests]: Whether integration tests are enabled.
  /// *   [enableE2ETests]: Whether end-to-end (E2E) tests are enabled.
  /// *   [runUnitTests]: Whether to execute unit tests as part of the pipeline.
  /// *   [coverageThreshold]: The minimum acceptable code coverage percentage.
  TestingConfig({
    required this.testingFramework,
    required this.enableUnitTests,
    required this.enableIntegrationTests,
    required this.enableE2ETests,
    required this.runUnitTests,
    required this.coverageThreshold,
  });

  /// Creates a [TestingConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [TestingConfig] object. It expects the JSON map to contain the keys
  /// 'testingFramework', 'enableUnitTests', 'enableIntegrationTests',
  /// 'enableE2ETests', 'runUnitTests', and 'coverageThreshold'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "testingFramework": "flutter_test",
  ///   "enableUnitTests": true,
  ///   "enableIntegrationTests": false,
  ///   "enableE2ETests": true,
  ///   "runUnitTests": true,
  ///   "coverageThreshold": 80
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory TestingConfig.fromJson(Map<String, dynamic> json) {
    return TestingConfig(
      testingFramework: json['testingFramework'] as String,
      enableUnitTests: json['enableUnitTests'] as bool,
      enableIntegrationTests: json['enableIntegrationTests'] as bool,
      enableE2ETests: json['enableE2ETests'] as bool,
      runUnitTests: json['runUnitTests'] as bool,
      coverageThreshold: json['coverageThreshold'] as int,
    );
  }

  /// The name of the testing framework used (e.g., "flutter_test", "jest").
  final String testingFramework;

  /// Whether unit tests are enabled for this configuration.
  ///
  /// This setting determines if unit tests are considered during the testing
  /// phase.
  final bool enableUnitTests;

  /// Whether integration tests are enabled for this configuration.
  ///
  /// This setting determines if integration tests are considered during the
  /// testing phase.
  final bool enableIntegrationTests;

  /// Whether end-to-end (E2E) tests are enabled for this configuration.
  ///
  /// This setting determines if E2E tests are considered during the testing
  /// phase.
  final bool enableE2ETests;

  /// Whether unit tests should be executed as part of the CI/CD pipeline.
  ///
  /// This is separate from [enableUnitTests] as you might want to have unit
  /// tests defined but not run them in every pipeline execution (e.g., only
  /// on specific branches or triggers).
  final bool runUnitTests;

  /// The minimum acceptable code coverage percentage.
  ///
  /// If the code coverage falls below this threshold, the build or deployment
  /// may be considered a failure.
  final int coverageThreshold;

  /// Converts this [TestingConfig] instance to a JSON map.
  ///
  /// This method serializes the [TestingConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'testingFramework', 'enableUnitTests',
  /// 'enableIntegrationTests', 'enableE2ETests', 'runUnitTests', and
  /// 'coverageThreshold' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'testingFramework': testingFramework,
        'enableUnitTests': enableUnitTests,
        'enableIntegrationTests': enableIntegrationTests,
        'enableE2ETests': enableE2ETests,
        'runUnitTests': runUnitTests,
        'coverageThreshold': coverageThreshold,
      };
}
