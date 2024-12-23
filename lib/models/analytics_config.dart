/// Represents the configuration for analytics functionality.
///
/// This class encapsulates settings related to enabling tracking, analytics,
/// and the API key required for analytics services. It provides methods for
/// converting between JSON and Dart objects, facilitating data persistence
/// and serialization.
class AnalyticsConfig {
  /// Creates an [AnalyticsConfig] instance.
  ///
  /// The [enableTracking], [enableAnalytics], and [apiKey] parameters are
  /// required and must be provided.
  AnalyticsConfig({
    required this.enableTracking,
    required this.enableAnalytics,
    required this.apiKey,
  });

  /// Creates an [AnalyticsConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [AnalyticsConfig] object. It expects the JSON map to contain the keys
  /// 'enableTracking', 'enableAnalytics', and 'apiKey'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "enableTracking": true,
  ///   "enableAnalytics": false,
  ///   "apiKey": "your_api_key"
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected types.
  factory AnalyticsConfig.fromJson(Map<String, dynamic> json) {
    return AnalyticsConfig(
      enableTracking: json['enableTracking'] as bool,
      enableAnalytics: json['enableAnalytics'] as bool,
      apiKey: json['apiKey'] as String,
    );
  }

  /// The API key used for analytics services.
  ///
  /// This key is required to authenticate and authorize requests to the
  /// analytics platform.
  final String apiKey;

  /// Whether analytics collection is enabled.
  ///
  /// If `true`, analytics data will be collected and sent to the analytics
  /// platform. If `false`, analytics collection will be disabled.
  final bool enableAnalytics;

  /// Whether user tracking is enabled.
  ///
  /// If `true`, user behavior and interactions will be tracked. If `false`,
  /// user tracking will be disabled.
  final bool enableTracking;

  /// Converts this [AnalyticsConfig] instance to a JSON map.
  ///
  /// This method serializes the [AnalyticsConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'enableTracking', 'enableAnalytics',
  /// and 'apiKey' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'enableTracking': enableTracking,
        'enableAnalytics': enableAnalytics,
        'apiKey': apiKey,
      };
}
