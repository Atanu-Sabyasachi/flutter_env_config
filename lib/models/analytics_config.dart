class AnalyticsConfig {
  AnalyticsConfig({
    required this.enableTracking,
    required this.enableAnalytics,
    required this.apiKey,
  });

  factory AnalyticsConfig.fromJson(Map<String, dynamic> json) {
    return AnalyticsConfig(
      enableTracking: json['enableTracking'] as bool,
      enableAnalytics: json['enableAnalytics'] as bool,
      apiKey: json['apiKey'] as String,
    );
  }

  final String apiKey;
  final bool enableAnalytics;
  final bool enableTracking;

  Map<String, dynamic> toJson() => {
        'enableTracking': enableTracking,
        'enableAnalytics': enableAnalytics,
        'apiKey': apiKey,
      };
}
