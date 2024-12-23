class RazorpayConfig {
  final String apiKey;
  final String secretKey;

  RazorpayConfig({
    required this.apiKey,
    required this.secretKey,
  });

  factory RazorpayConfig.fromJson(Map<String, dynamic> json) {
    return RazorpayConfig(
      apiKey: json['apiKey'] as String,
      secretKey: json['secretKey'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'apiKey': apiKey,
        'secretKey': secretKey,
      };
}
