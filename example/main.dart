// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_env_config/flutter_env_config.dart';
import 'package:flutter_env_config/enums/env_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await FlutterEnvConfig.init(
      configFile: 'assets/config.json',
      targetEnvironment: Environment.dev,
    );
    runApp(MyApp());
  } catch (e) {
    runApp(ErrorApp(errorMessage: e.toString()));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    EnvironmentConfig config = EnvironmentManager.environmentData;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Environment: ${config.name}'),
        ),
        body: Center(
          child: Text('API URL: ${config.api?.baseUrl}'),
        ),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to load environment: $errorMessage'),
        ),
      ),
    );
  }
}
