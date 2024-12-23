class LocalizationConfig {
  final String defaultLocale;
  final List<String> supportedLocales;

  LocalizationConfig(
      {required this.defaultLocale, required this.supportedLocales});

  factory LocalizationConfig.fromJson(Map<String, dynamic> json) {
    return LocalizationConfig(
      defaultLocale: json['defaultLocale'] as String,
      supportedLocales: List<String>.from(json['supportedLocales']),
    );
  }

  Map<String, dynamic> toJson() => {
        'defaultLocale': defaultLocale,
        'supportedLocales': supportedLocales,
      };
}
