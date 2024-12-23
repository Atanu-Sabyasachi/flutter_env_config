/// Represents the configuration for theming the application.
///
/// This class encapsulates settings related to the application's visual
/// appearance, including primary and secondary colors and the font family.
/// It provides methods for converting between JSON and Dart objects for data
/// persistence and serialization.
class ThemingConfig {
  /// Creates a [ThemingConfig] instance.
  ///
  /// All parameters are required:
  ///
  /// *   [primaryColor]: The primary color of the theme (e.g., "#FF0000" for red).
  /// *   [secondaryColor]: The secondary color of the theme (e.g., "#00FF00" for
  ///     green).
  /// *   [fontFamily]: The font family to use (e.g., "Roboto", "Arial").
  ThemingConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.fontFamily,
  });

  /// Creates a [ThemingConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [ThemingConfig] object. It expects the JSON map to contain the keys
  /// 'primaryColor', 'secondaryColor', and 'fontFamily'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "primaryColor": "#007AFF",
  ///   "secondaryColor": "#FF9500",
  ///   "fontFamily": "Roboto"
  /// }
  /// ```
  ///
  /// The `primaryColor` and `secondaryColor` are expected to be valid color
  /// strings, typically in hexadecimal format (e.g., "#RRGGBB" or "#AARRGGBB").
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory ThemingConfig.fromJson(Map<String, dynamic> json) {
    return ThemingConfig(
      primaryColor: json['primaryColor'] as String,
      secondaryColor: json['secondaryColor'] as String,
      fontFamily: json['fontFamily'] as String,
    );
  }

  /// The primary color of the theme.
  ///
  /// This color is typically used for primary UI elements like app bars,
  /// buttons, and accents. It's usually represented as a hexadecimal color
  /// string (e.g., "#FF0000" for red, "#007AFF" for blue).
  final String primaryColor;

  /// The secondary color of the theme.
  ///
  /// This color is typically used for secondary UI elements and accents. It's
  /// usually represented as a hexadecimal color string (e.g., "#00FF00" for
  /// green, "#FF9500" for orange).
  final String secondaryColor;

  /// The font family to use for text in the application.
  ///
  /// This string represents the name of the font family (e.g., "Roboto",
  /// "Arial", "Open Sans").
  final String fontFamily;

  /// Converts this [ThemingConfig] instance to a JSON map.
  ///
  /// This method serializes the [ThemingConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'primaryColor', 'secondaryColor', and
  /// 'fontFamily' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'primaryColor': primaryColor,
        'secondaryColor': secondaryColor,
        'fontFamily': fontFamily,
      };
}
