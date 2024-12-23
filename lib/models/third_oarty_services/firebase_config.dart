/// Represents the configuration for Firebase.
///
/// This class encapsulates the necessary settings to initialize and use
/// Firebase services within an application. It includes API keys, project
/// identifiers, and other Firebase-specific parameters. It provides methods
/// for converting between JSON and Dart objects for data persistence and
/// serialization.
class FirebaseConfig {
  /// Creates a [FirebaseConfig] instance.
  ///
  /// All parameters are required and correspond to Firebase project settings:
  /// *   [apiKey]: The Firebase API key.
  /// *   [projectId]: The Firebase project ID.
  /// *   [authDomain]: The Firebase authentication domain.
  /// *   [storageBucket]: The Firebase storage bucket.
  /// *   [messagingSenderId]: The Firebase Cloud Messaging (FCM) sender ID.
  /// *   [appId]: The Firebase app ID.
  /// *   [measurementId]: The Firebase measurement ID (for Google Analytics).
  FirebaseConfig({
    required this.apiKey,
    required this.projectId,
    required this.authDomain,
    required this.storageBucket,
    required this.messagingSenderId,
    required this.appId,
    required this.measurementId,
  });

  /// Creates a [FirebaseConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [FirebaseConfig] object. It expects the JSON map to contain the keys
  /// 'apiKey', 'projectId', 'authDomain', 'storageBucket',
  /// 'messagingSenderId', 'appId', and 'measurementId'.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "apiKey": "YOUR_API_KEY",
  ///   "projectId": "your-project-id",
  ///   "authDomain": "[invalid URL removed]",
  ///   "storageBucket": "[invalid URL removed]",
  ///   "messagingSenderId": "1234567890",
  ///   "appId": "1:1234567890:web:abcdef1234567890",
  ///   "measurementId": "G-ABCDEFGHIJ"
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory FirebaseConfig.fromJson(Map<String, dynamic> json) {
    return FirebaseConfig(
      apiKey: json['apiKey'] as String,
      projectId: json['projectId'] as String,
      authDomain: json['authDomain'] as String,
      storageBucket: json['storageBucket'] as String,
      messagingSenderId: json['messagingSenderId'] as String,
      appId: json['appId'] as String,
      measurementId: json['measurementId'] as String,
    );
  }

  /// The Firebase API key.
  ///
  /// This key is used for authenticating requests to Firebase services.
  final String apiKey;

  /// The Firebase project ID.
  ///
  /// This ID uniquely identifies your Firebase project.
  final String projectId;

  /// The Firebase authentication domain.
  ///
  /// This domain is used for Firebase Authentication.
  final String authDomain;

  /// The Firebase storage bucket.
  ///
  /// This bucket is used for storing files in Firebase Storage.
  final String storageBucket;

  /// The Firebase Cloud Messaging (FCM) sender ID.
  ///
  /// This ID is used for sending push notifications.
  final String messagingSenderId;

  /// The Firebase app ID.
  ///
  /// This ID uniquely identifies your Firebase app within the project.
  final String appId;

  /// The Firebase measurement ID (for Google Analytics).
  ///
  /// This ID is used for tracking analytics data in Google Analytics.
  final String measurementId;

  /// Converts this [FirebaseConfig] instance to a JSON map.
  ///
  /// This method serializes the [FirebaseConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'apiKey', 'projectId', 'authDomain',
  /// 'storageBucket', 'messagingSenderId', 'appId', and 'measurementId'
  /// keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'apiKey': apiKey,
        'projectId': projectId,
        'authDomain': authDomain,
        'storageBucket': storageBucket,
        'messagingSenderId': messagingSenderId,
        'appId': appId,
        'measurementId': measurementId,
      };
}
