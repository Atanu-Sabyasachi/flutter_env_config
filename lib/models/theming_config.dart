class ThemingConfig {
  ThemingConfig({
    required this.primaryColor,
    required this.secondaryColor,
    required this.fontFamily,
  });

  factory ThemingConfig.fromJson(Map<String, dynamic> json) {
    return ThemingConfig(
      primaryColor: json['primaryColor'] as String,
      secondaryColor: json['secondaryColor'] as String,
      fontFamily: json['fontFamily'] as String,
    );
  }

  final String fontFamily;
  final String primaryColor;
  final String secondaryColor;

  Map<String, dynamic> toJson() => {
        'primaryColor': primaryColor,
        'secondaryColor': secondaryColor,
        'fontFamily': fontFamily,
      };
}
