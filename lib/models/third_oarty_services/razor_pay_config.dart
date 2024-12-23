/// Represents the configuration for Razorpay payment gateway.
///
/// This class encapsulates the API key and secret key required to interact
/// with the Razorpay API. It provides methods for converting between JSON
/// and Dart objects for data persistence and serialization.
///
/// **Important Security Note:** The `secretKey` should be handled with extreme
/// care. Avoid exposing it in client-side code or storing it in version
/// control. Ideally, it should only be used on a secure server.
class RazorpayConfig {
  /// Creates a [RazorpayConfig] instance.
  ///
  /// Both [apiKey] and [secretKey] are required.
  ///
  /// **Security Warning:** Do not expose the [secretKey] in client-side code.
  RazorpayConfig({
    required this.apiKey,
    required this.secretKey,
  });

  /// Creates a [RazorpayConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [RazorpayConfig] object. It expects the JSON map to contain the keys
  /// 'apiKey' and 'secretKey'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "apiKey": "YOUR_RAZORPAY_KEY_ID",
  ///   "secretKey": "YOUR_RAZORPAY_KEY_SECRET"
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory RazorpayConfig.fromJson(Map<String, dynamic> json) {
    return RazorpayConfig(
      apiKey: json['apiKey'] as String,
      secretKey: json['secretKey'] as String,
    );
  }

  /// The Razorpay Key ID (API key).
  ///
  /// This key is used to identify your Razorpay account.
  final String apiKey;

  /// The Razorpay Key Secret.
  ///
  /// This key is used to authenticate requests to the Razorpay API.
  ///
  /// **Critical Security Warning:** This key must be kept confidential and
  /// should *never* be exposed in client-side code or stored directly in
  /// version control. It should only be used in a secure server environment.
  final String secretKey;

  /// Converts this [RazorpayConfig] instance to a JSON map.
  ///
  /// This method serializes the [RazorpayConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'apiKey' and 'secretKey' keys and their
  /// corresponding values.
  ///
  /// **Security Note:** Be extremely cautious when handling the JSON
  /// representation of this object, especially if it contains the
  /// [secretKey].
  Map<String, dynamic> toJson() => {
        'apiKey': apiKey,
        'secretKey': secretKey,
      };
}
