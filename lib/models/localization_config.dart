/// Represents the configuration for localization settings.
///
/// This class encapsulates settings related to localization, including the
/// default locale and a list of supported locales. It provides methods for
/// converting between JSON and Dart objects for data persistence and
/// serialization.
class LocalizationConfig {
  /// Creates a [LocalizationConfig] instance.
  ///
  /// Both [defaultLocale] and [supportedLocales] are required.
  ///
  /// *   [defaultLocale]: The default locale for the application (e.g., "en_US",
  ///     "es").
  /// *   [supportedLocales]: A list of supported locales (e.g., ["en", "es",
  ///     "fr"]).
  LocalizationConfig({
    required this.defaultLocale,
    required this.supportedLocales,
  });

  /// Creates a [LocalizationConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [LocalizationConfig] object. It expects the JSON map to contain the keys
  /// 'defaultLocale' and 'supportedLocales'. The 'supportedLocales' value
  /// should be a JSON array of strings.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "defaultLocale": "en_US",
  ///   "supportedLocales": ["en", "es", "fr"]
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory LocalizationConfig.fromJson(Map<String, dynamic> json) {
    return LocalizationConfig(
      defaultLocale: json['defaultLocale'] as String,
      supportedLocales: List<String>.from(json['supportedLocales']),
    );
  }

  /// The default locale for the application.
  ///
  /// This locale is used if no other locale is specified or available. It
  /// should be a valid locale string (e.g., "en_US", "es", "fr_CA").
  final String defaultLocale;

  /// A list of supported locales.
  ///
  /// This list specifies the locales that the application supports. Each
  /// element in the list should be a valid locale string (e.g., "en", "es",
  /// "fr").
  final List<String> supportedLocales;

  /// Converts this [LocalizationConfig] instance to a JSON map.
  ///
  /// This method serializes the [LocalizationConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'defaultLocale' and 'supportedLocales'
  /// keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'defaultLocale': defaultLocale,
        'supportedLocales': supportedLocales,
      };
}
