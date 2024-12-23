/// Represents the configuration for API requests.
///
/// This class encapsulates settings related to API communication, including
/// the base URL and timeout duration for requests. It provides methods for
/// converting between JSON and Dart objects for data persistence and
/// serialization.
class ApiConfig {
  /// Creates an [ApiConfig] instance.
  ///
  /// The [baseUrl] and [timeout] parameters are required.
  ///
  /// *   [baseUrl]: The base URL for API requests (e.g.,
  ///     "[https://api.example.com](https://api.example.com)").
  /// *   [timeout]: The timeout duration for API requests in milliseconds.
  ApiConfig({required this.baseUrl, required this.timeout});

  /// Creates an [ApiConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [ApiConfig] object. It expects the JSON map to contain the keys
  /// 'baseUrl' and 'timeout'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "baseUrl": "[https://api.example.com](https://api.example.com)",
  ///   "timeout": 10000
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      baseUrl: json['baseUrl'] as String,
      timeout: json['timeout'] as int,
    );
  }

  /// The base URL for API requests.
  ///
  /// This URL is used as the prefix for all API endpoints.
  final String baseUrl;

  /// The timeout duration for API requests in milliseconds.
  ///
  /// This value determines how long the application will wait for a response
  /// from the API before timing out.
  final int timeout;

  /// Converts this [ApiConfig] instance to a JSON map.
  ///
  /// This method serializes the [ApiConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'baseUrl' and 'timeout' keys and their
  /// corresponding values.
  Map<String, dynamic> toJson() => {
        'baseUrl': baseUrl,
        'timeout': timeout,
      };
}
