/// Represents the configuration for Stripe payment gateway.
///
/// This class encapsulates the publishable key and secret key required to
/// interact with the Stripe API. It provides methods for converting between
/// JSON and Dart objects for data persistence and serialization.
///
/// **Important Security Note:** The `secretKey` should be handled with extreme
/// care. Avoid exposing it in client-side code or storing it in version
/// control. Ideally, it should only be used on a secure server.
class StripeConfig {
  /// Creates a [StripeConfig] instance.
  ///
  /// Both [publishableKey] and [secretKey] are required.
  ///
  /// **Security Warning:** Do not expose the [secretKey] in client-side code.
  StripeConfig({
    required this.publishableKey,
    required this.secretKey,
  });

  /// Creates a [StripeConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [StripeConfig] object. It expects the JSON map to contain the keys
  /// 'publishableKey' and 'secretKey'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "publishableKey": "pk_test_...",
  ///   "secretKey": "sk_test_..."
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory StripeConfig.fromJson(Map<String, dynamic> json) {
    return StripeConfig(
      publishableKey: json['publishableKey'] as String,
      secretKey: json['secretKey'] as String,
    );
  }

  /// The Stripe publishable key.
  ///
  /// This key is safe to use in client-side code (e.g., in your web or mobile
  /// application). It's used for client-side operations like creating tokens
  /// or displaying payment forms.
  final String publishableKey;

  /// The Stripe secret key.
  ///
  /// This key is used for server-side operations like creating charges,
  /// refunds, or managing customers.
  ///
  /// **Critical Security Warning:** This key must be kept confidential and
  /// should *never* be exposed in client-side code or stored directly in
  /// version control. It should only be used in a secure server environment.
  final String secretKey;

  /// Converts this [StripeConfig] instance to a JSON map.
  ///
  /// This method serializes the [StripeConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'publishableKey' and 'secretKey' keys
  /// and their corresponding values.
  ///
  /// **Security Note:** Be extremely cautious when handling the JSON
  /// representation of this object, especially if it contains the
  /// [secretKey].
  Map<String, dynamic> toJson() => {
        'publishableKey': publishableKey,
        'secretKey': secretKey,
      };
}
