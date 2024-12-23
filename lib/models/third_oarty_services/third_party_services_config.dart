import 'package:flutter_env_config/models/third_oarty_services/firebase_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/razor_pay_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/stripe_config.dart';

class ThirdPartyServicesConfig {
  final bool enablePaymentGateway;
  final bool enableAnalyticsIntegration;
  final FirebaseConfig firebaseConfig;
  final RazorpayConfig razorpayConfig;
  final StripeConfig stripeConfig;

  ThirdPartyServicesConfig({
    required this.enablePaymentGateway,
    required this.enableAnalyticsIntegration,
    required this.firebaseConfig,
    required this.razorpayConfig,
    required this.stripeConfig,
  });

  factory ThirdPartyServicesConfig.fromJson(Map<String, dynamic> json) {
    return ThirdPartyServicesConfig(
      enablePaymentGateway: json['enablePaymentGateway'] as bool,
      enableAnalyticsIntegration: json['enableAnalyticsIntegration'] as bool,
      firebaseConfig: FirebaseConfig.fromJson(json['firebaseConfig']),
      razorpayConfig: RazorpayConfig.fromJson(json['razorpayConfig']),
      stripeConfig: StripeConfig.fromJson(json['stripeConfig']),
    );
  }

  Map<String, dynamic> toJson() => {
        'enablePaymentGateway': enablePaymentGateway,
        'enableAnalyticsIntegration': enableAnalyticsIntegration,
        'firebaseConfig': firebaseConfig.toJson(),
        'razorpayConfig': razorpayConfig.toJson(),
        'stripeConfig': stripeConfig.toJson(),
      };
}
