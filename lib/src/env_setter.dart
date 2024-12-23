import 'package:flutter_env_config/enums/env_enum.dart';
import 'package:flutter_env_config/flutter_env_config.dart';

void setEnvironment(Environment environment) async {
  String filePath;
  switch (environment) {
    case Environment.dev:
      filePath = 'assets/config.json'; // or any specific path for dev
      break;
    case Environment.staging:
      filePath = 'assets/config.json'; // or any specific path for staging
      break;
    case Environment.prod:
      filePath = 'assets/config.json'; // or any specific path for prod
      break;
  }

  // Load configuration from the selected environment's file.
  await EnvironmentManager().loadFromFile(
    filePath,
    format: 'json',
    targetEnvironment: environment,
  );
}
