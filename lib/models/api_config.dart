class ApiConfig {
  final String baseUrl;
  final int timeout;

  ApiConfig({required this.baseUrl, required this.timeout});

  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      baseUrl: json['baseUrl'] as String,
      timeout: json['timeout'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'baseUrl': baseUrl,
        'timeout': timeout,
      };
}
