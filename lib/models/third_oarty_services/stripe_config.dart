class StripeConfig {
  final String publishableKey;
  final String secretKey;

  StripeConfig({
    required this.publishableKey,
    required this.secretKey,
  });

  factory StripeConfig.fromJson(Map<String, dynamic> json) {
    return StripeConfig(
      publishableKey: json['publishableKey'] as String,
      secretKey: json['secretKey'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'publishableKey': publishableKey,
        'secretKey': secretKey,
      };
}
