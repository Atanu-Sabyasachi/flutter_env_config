class LoggingConfig {
  final bool enableLogging;
  final String logLevel;

  LoggingConfig({required this.enableLogging, required this.logLevel});

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      enableLogging: json['enableLogging'] as bool,
      logLevel: json['logLevel'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'enableLogging': enableLogging,
        'logLevel': logLevel,
      };
}
