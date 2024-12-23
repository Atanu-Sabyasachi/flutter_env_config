import 'package:flutter_env_config/models/third_oarty_services/firebase_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/razor_pay_config.dart';
import 'package:flutter_env_config/models/third_oarty_services/stripe_config.dart';

/// Represents the configuration for third-party services used by the application.
///
/// This class encapsulates settings for various third-party integrations,
/// including payment gateways (Razorpay, Stripe) and analytics (Firebase).
/// It provides methods for converting between JSON and Dart objects for data
/// persistence and serialization.
class ThirdPartyServicesConfig {
  /// Whether payment gateway functionality is enabled.
  ///
  /// If `true`, payment processing via Razorpay or Stripe is enabled.
  final bool enablePaymentGateway;

  /// Whether analytics integration (Firebase) is enabled.
  ///
  /// If `true`, analytics data collection and reporting is enabled.
  final bool enableAnalyticsIntegration;

  /// Configuration settings for Firebase.
  final FirebaseConfig firebaseConfig;

  /// Configuration settings for Razorpay payment gateway.
  final RazorpayConfig razorpayConfig;

  /// Configuration settings for Stripe payment gateway.
  final StripeConfig stripeConfig;

  /// Creates a [ThirdPartyServicesConfig] instance.
  ///
  /// All parameters are required:
  /// *   [enablePaymentGateway]: Whether payment gateway functionality is enabled.
  /// *   [enableAnalyticsIntegration]: Whether analytics integration is enabled.
  /// *   [firebaseConfig]: Configuration settings for Firebase.
  /// *   [razorpayConfig]: Configuration settings for Razorpay.
  /// *   [stripeConfig]: Configuration settings for Stripe.
  ThirdPartyServicesConfig({
    required this.enablePaymentGateway,
    required this.enableAnalyticsIntegration,
    required this.firebaseConfig,
    required this.razorpayConfig,
    required this.stripeConfig,
  });

  /// Creates a [ThirdPartyServicesConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [ThirdPartyServicesConfig] object. It expects the JSON map to contain the
  /// keys 'enablePaymentGateway', 'enableAnalyticsIntegration',
  /// 'firebaseConfig', 'razorpayConfig', and 'stripeConfig', with each
  /// nested configuration represented as a JSON object.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "enablePaymentGateway": true,
  ///   "enableAnalyticsIntegration": true,
  ///   "firebaseConfig": {
  ///     "apiKey": "YOUR_API_KEY",
  ///     "projectId": "your-project-id",
  ///     "authDomain": "[invalid URL removed]",
  ///     "storageBucket": "[invalid URL removed]",
  ///     "messagingSenderId": "1234567890",
  ///     "appId": "1:1234567890:web:abcdef1234567890",
  ///     "measurementId": "G-ABCDEFGHIJ"
  ///   },
  ///   "razorpayConfig": {
  ///     "apiKey": "YOUR_RAZORPAY_KEY_ID",
  ///     "secretKey": "YOUR_RAZORPAY_KEY_SECRET"
  ///   },
  ///   "stripeConfig": {
  ///     "publishableKey": "pk_test_...",
  ///     "secretKey": "sk_test_..."
  ///   }
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types or if nested JSON structures are invalid.
  factory ThirdPartyServicesConfig.fromJson(Map<String, dynamic> json) {
    return ThirdPartyServicesConfig(
      enablePaymentGateway: json['enablePaymentGateway'] as bool,
      enableAnalyticsIntegration: json['enableAnalyticsIntegration'] as bool,
      firebaseConfig: FirebaseConfig.fromJson(json['firebaseConfig']),
      razorpayConfig: RazorpayConfig.fromJson(json['razorpayConfig']),
      stripeConfig: StripeConfig.fromJson(json['stripeConfig']),
    );
  }

  /// Converts this [ThirdPartyServicesConfig] instance to a JSON map.
  ///
  /// This method serializes the [ThirdPartyServicesConfig] object into a JSON
  /// representation that can be easily stored or transmitted. The nested
  /// configurations ([firebaseConfig], [razorpayConfig], [stripeConfig]) are
  /// also converted to their JSON representations.
  ///
  /// Returns a [Map] containing the 'enablePaymentGateway',
  /// 'enableAnalyticsIntegration', 'firebaseConfig', 'razorpayConfig', and
  /// 'stripeConfig' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'enablePaymentGateway': enablePaymentGateway,
        'enableAnalyticsIntegration': enableAnalyticsIntegration,
        'firebaseConfig': firebaseConfig.toJson(),
        'razorpayConfig': razorpayConfig.toJson(),
        'stripeConfig': stripeConfig.toJson(),
      };
}
