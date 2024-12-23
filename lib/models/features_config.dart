class FeaturesConfig {
  FeaturesConfig({
    this.enableBetaFeatures,
    this.featureFlag,
    this.featureOneEnabled,
    this.featureTwoEnabled,
  });

  factory FeaturesConfig.fromJson(Map<String, dynamic> json) {
    return FeaturesConfig(
      featureOneEnabled: json['featureOneEnabled'] as bool,
      featureTwoEnabled: json['featureTwoEnabled'] as bool,
      enableBetaFeatures: json['enableBetaFeatures'] as bool,
      featureFlag: json['featureFlag'] as bool,
    );
  }

  final bool? enableBetaFeatures;
  final bool? featureFlag;
  final bool? featureOneEnabled;
  final bool? featureTwoEnabled;

  Map<String, dynamic> toJson() => {
        'featureOneEnabled': featureOneEnabled,
        'featureTwoEnabled': featureTwoEnabled,
        'enableBetaFeatures': enableBetaFeatures,
        'featureFlag': featureFlag,
      };
}
