/// Represents the configuration for feature flags and beta features.
///
/// This class encapsulates settings related to enabling or disabling specific
/// features within the application. It provides methods for converting
/// between JSON and Dart objects for data persistence and serialization.
///
/// All fields in this class are nullable, allowing for flexibility in
/// configuration and handling of missing values.
class FeaturesConfig {
  /// Creates a [FeaturesConfig] instance.
  ///
  /// All parameters are optional:
  /// *   [enableBetaFeatures]: Enables or disables beta features.
  /// *   [featureFlag]: A general-purpose feature flag.
  /// *   [featureOneEnabled]: Enables or disables feature one.
  /// *   [featureTwoEnabled]: Enables or disables feature two.
  FeaturesConfig({
    this.enableBetaFeatures,
    this.featureFlag,
    this.featureOneEnabled,
    this.featureTwoEnabled,
  });

  /// Creates a [FeaturesConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [FeaturesConfig] object. It expects the JSON map to optionally contain
  /// the keys 'featureOneEnabled', 'featureTwoEnabled', 'enableBetaFeatures',
  /// and 'featureFlag'. Missing keys will result in `null` values for the
  /// corresponding fields.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "featureOneEnabled": true,
  ///   "featureTwoEnabled": false,
  ///   "enableBetaFeatures": true,
  ///   "featureFlag": null // Example of a missing value
  /// }
  /// ```
  ///
  /// Note that although the fields are nullable, providing incorrect types in the
  /// JSON (e.g., a String where a bool is expected) will still result in a
  /// [TypeError].
  factory FeaturesConfig.fromJson(Map<String, dynamic> json) {
    return FeaturesConfig(
      featureOneEnabled: json['featureOneEnabled'] as bool?,
      featureTwoEnabled: json['featureTwoEnabled'] as bool?,
      enableBetaFeatures: json['enableBetaFeatures'] as bool?,
      featureFlag: json['featureFlag'] as bool?,
    );
  }

  /// Enables or disables beta features.
  ///
  /// When `true`, beta features are available to the user. When `false` or
  /// `null`, beta features are disabled.
  final bool? enableBetaFeatures;

  /// A general-purpose feature flag.
  ///
  /// This can be used to control the availability of any feature. `true`
  /// enables the feature, `false` or `null` disables it.
  final bool? featureFlag;

  /// Enables or disables feature one.
  ///
  /// When `true`, feature one is enabled. When `false` or `null`, feature one
  /// is disabled.
  final bool? featureOneEnabled;

  /// Enables or disables feature two.
  ///
  /// When `true`, feature two is enabled. When `false` or `null`, feature two
  /// is disabled.
  final bool? featureTwoEnabled;

  /// Converts this [FeaturesConfig] instance to a JSON map.
  ///
  /// This method serializes the [FeaturesConfig] object into a JSON
  /// representation that can be easily stored or transmitted. `null` values
  /// are included in the JSON output.
  ///
  /// Returns a [Map] containing the 'featureOneEnabled', 'featureTwoEnabled',
  /// 'enableBetaFeatures', and 'featureFlag' keys and their corresponding
  /// values (including `null` values).
  Map<String, dynamic> toJson() => {
        'featureOneEnabled': featureOneEnabled,
        'featureTwoEnabled': featureTwoEnabled,
        'enableBetaFeatures': enableBetaFeatures,
        'featureFlag': featureFlag,
      };
}
