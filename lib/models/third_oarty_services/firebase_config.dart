class FirebaseConfig {
  final String apiKey;
  final String projectId;
  final String authDomain;
  final String storageBucket;
  final String messagingSenderId;
  final String appId;
  final String measurementId;

  FirebaseConfig({
    required this.apiKey,
    required this.projectId,
    required this.authDomain,
    required this.storageBucket,
    required this.messagingSenderId,
    required this.appId,
    required this.measurementId,
  });

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
