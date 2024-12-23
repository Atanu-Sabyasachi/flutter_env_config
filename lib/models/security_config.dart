class SecurityConfig {
  final bool enableEncryption;
  final bool enableSecureStorage;
  final bool sslPinning;
  final String encryptionKey;

  SecurityConfig({
    required this.enableEncryption,
    required this.enableSecureStorage,
    required this.sslPinning,
    required this.encryptionKey,
  });

  factory SecurityConfig.fromJson(Map<String, dynamic> json) {
    return SecurityConfig(
      enableEncryption: json['enableEncryption'] as bool,
      encryptionKey: json['encryptionKey'] as String,
      enableSecureStorage: json['enableSecureStorage'] as bool,
      sslPinning: json['sslPinning'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'enableEncryption': enableEncryption,
        'encryptionKey': encryptionKey,
        'enableSecureStorage': enableSecureStorage,
        'sslPinning': sslPinning,
      };
}
