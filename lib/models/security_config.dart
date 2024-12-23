/// Represents the configuration for security settings.
///
/// This class encapsulates settings related to security features, including
/// encryption, secure storage, and SSL pinning. It provides methods for
/// converting between JSON and Dart objects for data persistence and
/// serialization.
///
/// **Important Security Note:** The `encryptionKey` should be handled with
/// extreme care. Avoid exposing it in client-side code or storing it in
/// version control. Ideally, it should be securely managed and retrieved
/// at runtime.
class SecurityConfig {
  /// Creates a [SecurityConfig] instance.
  ///
  /// All parameters are required:
  ///
  /// *   [enableEncryption]: Whether data encryption is enabled.
  /// *   [enableSecureStorage]: Whether secure storage mechanisms should be used
  ///     for sensitive data.
  /// *   [sslPinning]: Whether SSL pinning is enabled for network connections.
  /// *   [encryptionKey]: The encryption key used for data encryption.
  ///
  /// **Security Warning:** Do not expose the [encryptionKey] in client-side
  /// code.
  SecurityConfig({
    required this.enableEncryption,
    required this.enableSecureStorage,
    required this.sslPinning,
    required this.encryptionKey,
  });

  /// Creates a [SecurityConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [SecurityConfig] object. It expects the JSON map to contain the keys
  /// 'enableEncryption', 'encryptionKey', 'enableSecureStorage', and
  /// 'sslPinning'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "enableEncryption": true,
  ///   "encryptionKey": "YOUR_ENCRYPTION_KEY",
  ///   "enableSecureStorage": true,
  ///   "sslPinning": false
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory SecurityConfig.fromJson(Map<String, dynamic> json) {
    return SecurityConfig(
      enableEncryption: json['enableEncryption'] as bool,
      encryptionKey: json['encryptionKey'] as String,
      enableSecureStorage: json['enableSecureStorage'] as bool,
      sslPinning: json['sslPinning'] as bool,
    );
  }

  /// Whether data encryption is enabled.
  ///
  /// If `true`, data encryption is enabled; otherwise, it is disabled.
  final bool enableEncryption;

  /// Whether secure storage mechanisms should be used for sensitive data.
  ///
  /// If `true`, sensitive data will be stored using platform-specific secure
  /// storage mechanisms (e.g., Keychain on iOS, Keystore on Android).
  final bool enableSecureStorage;

  /// Whether SSL pinning is enabled for network connections.
  ///
  /// If `true`, the application will validate the server's SSL certificate
  /// against a pre-defined set of pins, adding an extra layer of security
  /// against man-in-the-middle attacks.
  final bool sslPinning;

  /// The encryption key used for data encryption.
  ///
  /// **Critical Security Warning:** This key must be kept confidential and
  /// should *never* be exposed in client-side code or stored directly in
  /// version control. It should only be used in a secure server environment
  /// or retrieved from a secure key management system at runtime.
  final String encryptionKey;

  /// Converts this [SecurityConfig] instance to a JSON map.
  ///
  /// This method serializes the [SecurityConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'enableEncryption', 'encryptionKey',
  /// 'enableSecureStorage', and 'sslPinning' keys and their corresponding
  /// values.
  ///
  /// **Security Note:** Be extremely cautious when handling the JSON
  /// representation of this object, especially if it contains the
  /// [encryptionKey].
  Map<String, dynamic> toJson() => {
        'enableEncryption': enableEncryption,
        'encryptionKey': encryptionKey,
        'enableSecureStorage': enableSecureStorage,
        'sslPinning': sslPinning,
      };
}
