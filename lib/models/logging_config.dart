/// Represents the configuration for logging.
///
/// This class encapsulates settings related to logging, including whether
/// logging is enabled and the logging level. It provides methods for
/// converting between JSON and Dart objects for data persistence and
/// serialization.
class LoggingConfig {
  /// Creates a [LoggingConfig] instance.
  ///
  /// Both [enableLogging] and [logLevel] are required.
  ///
  /// *   [enableLogging]: Whether logging is enabled.
  /// *   [logLevel]: The logging level (e.g., "DEBUG", "INFO", "WARNING",
  ///     "ERROR").
  LoggingConfig({
    required this.enableLogging,
    required this.logLevel,
  });

  /// Creates a [LoggingConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [LoggingConfig] object. It expects the JSON map to contain the keys
  /// 'enableLogging' and 'logLevel'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "enableLogging": true,
  ///   "logLevel": "INFO"
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      enableLogging: json['enableLogging'] as bool,
      logLevel: json['logLevel'] as String,
    );
  }

  /// Whether logging is enabled.
  ///
  /// If `true`, logging is enabled; otherwise, it is disabled.
  final bool enableLogging;

  /// The logging level.
  ///
  /// This string represents the minimum logging level that will be output.
  /// Common values include:
  ///
  /// *   `"DEBUG"`: Detailed information, useful for debugging.
  /// *   `"INFO"`: General information about the application's execution.
  /// *   `"WARNING"`: Indicates potential problems or unexpected situations.
  /// *   `"ERROR"`: Indicates errors that have occurred.
  /// *   `"OFF"`: Disables all logging.
  ///
  /// The specific log levels and their behavior depend on the logging
  /// implementation used in the application.
  final String logLevel;

  /// Converts this [LoggingConfig] instance to a JSON map.
  ///
  /// This method serializes the [LoggingConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'enableLogging' and 'logLevel' keys and
  /// their corresponding values.
  Map<String, dynamic> toJson() => {
        'enableLogging': enableLogging,
        'logLevel': logLevel,
      };
}
