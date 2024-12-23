class TestingConfig {
  final String testingFramework;
  final bool enableUnitTests;
  final bool enableIntegrationTests;
  final bool enableE2ETests;
  final bool runUnitTests;
  final int coverageThreshold;

  TestingConfig({
    required this.testingFramework,
    required this.enableUnitTests,
    required this.enableIntegrationTests,
    required this.enableE2ETests,
    required this.runUnitTests,
    required this.coverageThreshold,
  });

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

  Map<String, dynamic> toJson() => {
        'testingFramework': testingFramework,
        'enableUnitTests': enableUnitTests,
        'enableIntegrationTests': enableIntegrationTests,
        'enableE2ETests': enableE2ETests,
        'runUnitTests': runUnitTests,
        'coverageThreshold': coverageThreshold,
      };
}
