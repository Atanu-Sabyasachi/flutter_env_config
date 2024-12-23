// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:yaml_writer/yaml_writer.dart';

void main(List<String> arguments) {
  const jsonConfigFilePath = 'assets/config.json';
  const yamlConfigFilePath = 'assets/config.yaml';

  // Default config structure
  final defaultConfig = {
    "dev": {
      "environment": "dev",
      "name": "Development",
      "api": {
        "baseUrl": "https://dev.api.com",
        "timeout": 30000,
      },
      "ciCd": {
        "variables": {
          "apiKeyEnvVar": "DEV_API_KEY",
          "databaseUrlEnvVar": "DEV_DATABASE_URL"
        },
        "build": {
          "buildId": "12345",
          "branchName": "dev",
          "commitHash": "dev123hash"
        },
        "deployment": {
          "server": "https://dev.server.com",
          "artifactName": "dev_app_build.apk",
          "rollbackOnFailure": true,
          "deploymentId": "",
          "environment": "",
          "url": "",
        },
        "testing": {
          "runUnitTests": true,
          "coverageThreshold": 70,
          "testingFramework": "",
          "enableUnitTests": false,
          "enableIntegrationTests": false,
          "enableE2ETests": false,
        }
      },
      "features": {
        "enableBetaFeatures": true,
        "featureFlag": true,
        "featureOneEnabled": false,
        "featureTwoEnabled": false,
      },
      "logging": {
        "logLevel": "debug",
        "enableLogging": true,
      },
      "security": {
        "enableEncryption": true,
        "encryptionKey": "",
        "enableSecureStorage": true,
        "sslPinning": false,
      },
      "analytics": {
        "enableAnalytics": true,
        "apiKey": "DEV_ANALYTICS_KEY",
        "enableTracking": true,
      },
      "localization": {
        "defaultLocale": "en",
        "supportedLocales": ["en", "fr", "es"]
      },
      "theming": {
        "primaryColor": "#FF5733",
        "secondaryColor": "#33FF57",
        "fontFamily": "Roboto"
      },
      "thirdPartyServices": {
        "firebaseConfig": {
          "apiKey": "DEV_FIREBASE_KEY",
          "projectId": "dev-project-id",
          "appId": "",
          "messagingSenderId": "",
          "storageBucket": "",
          "authDomain": "",
          "measurementId": "",
        },
        "enablePaymentGateway": true,
        "enableAnalyticsIntegration": true,
        "razorpayConfig": {
          "apiKey": "",
          "secretKey": "",
        },
        "stripeConfig": {
          "publishableKey": "",
          "secretKey": "",
        },
      },
      "scheduledTasks": {
        "tasks": [''],
        "syncInterval": 300,
        "cleanupInterval": 600,
      }
    },
    "staging": {
      "environment": "staging",
      "name": "Staging",
      "api": {
        "baseUrl": "https://staging.api.com",
        "timeout": 30000,
      },
      "ciCd": {
        "variables": {
          "apiKeyEnvVar": "STAGING_API_KEY",
          "databaseUrlEnvVar": "STAGING_DATABASE_URL"
        },
        "build": {
          "buildId": "12345",
          "branchName": "staging",
          "commitHash": "staging123hash"
        },
        "deployment": {
          "server": "https://staging.server.com",
          "artifactName": "staging_app_build.apk",
          "rollbackOnFailure": true,
          "deploymentId": "",
          "environment": "",
          "url": "",
        },
        "testing": {
          "runUnitTests": true,
          "coverageThreshold": 70,
          "testingFramework": "",
          "enableUnitTests": false,
          "enableIntegrationTests": false,
          "enableE2ETests": false,
        }
      },
      "features": {
        "enableBetaFeatures": true,
        "featureFlag": true,
        "featureOneEnabled": false,
        "featureTwoEnabled": false,
      },
      "logging": {
        "logLevel": "info",
        "enableLogging": true,
      },
      "security": {
        "enableEncryption": true,
        "encryptionKey": "",
        "enableSecureStorage": true,
        "sslPinning": false,
      },
      "analytics": {
        "enableAnalytics": true,
        "apiKey": "STAGING_ANALYTICS_KEY",
        "enableTracking": true,
      },
      "localization": {
        "defaultLocale": "en",
        "supportedLocales": ["en", "fr", "es"]
      },
      "theming": {
        "primaryColor": "#FF5733",
        "secondaryColor": "#33FF57",
        "fontFamily": "Roboto"
      },
      "thirdPartyServices": {
        "firebaseConfig": {
          "apiKey": "STAGING_FIREBASE_KEY",
          "projectId": "staging-project-id",
          "appId": "",
          "messagingSenderId": "",
          "storageBucket": "",
          "authDomain": "",
          "measurementId": "",
        },
        "enablePaymentGateway": true,
        "enableAnalyticsIntegration": true,
        "razorpayConfig": {
          "apiKey": "",
          "secretKey": "",
        },
        "stripeConfig": {
          "publishableKey": "",
          "secretKey": "",
        },
      },
      "scheduledTasks": {
        "tasks": [''],
        "syncInterval": 300,
        "cleanupInterval": 600,
      }
    },
    "prod": {
      "environment": "prod",
      "name": "Production",
      "api": {
        "baseUrl": "https://api.com",
        "timeout": 30000,
      },
      "ciCd": {
        "variables": {
          "apiKeyEnvVar": "PROD_API_KEY",
          "databaseUrlEnvVar": "PROD_DATABASE_URL"
        },
        "build": {
          "buildId": "12345",
          "branchName": "prod",
          "commitHash": "prod123hash"
        },
        "deployment": {
          "server": "https://prod.server.com",
          "artifactName": "prod_app_build.apk",
          "rollbackOnFailure": true,
          "deploymentId": "",
          "environment": "",
          "url": "",
        },
        "testing": {
          "runUnitTests": true,
          "coverageThreshold": 70,
          "testingFramework": "",
          "enableUnitTests": false,
          "enableIntegrationTests": false,
          "enableE2ETests": false,
        }
      },
      "features": {
        "enableBetaFeatures": true,
        "featureFlag": true,
        "featureOneEnabled": false,
        "featureTwoEnabled": false,
      },
      "logging": {
        "logLevel": "error",
        "enableLogging": true,
      },
      "security": {
        "enableEncryption": true,
        "encryptionKey": "",
        "enableSecureStorage": true,
        "sslPinning": false,
      },
      "analytics": {
        "enableAnalytics": true,
        "apiKey": "PROD_ANALYTICS_KEY",
        "enableTracking": true,
      },
      "localization": {
        "defaultLocale": "en",
        "supportedLocales": ["en", "fr", "es"]
      },
      "theming": {
        "primaryColor": "#FF5733",
        "secondaryColor": "#33FF57",
        "fontFamily": "Roboto"
      },
      "thirdPartyServices": {
        "firebaseConfig": {
          "apiKey": "PROD_FIREBASE_KEY",
          "projectId": "prod-project-id",
          "appId": "",
          "messagingSenderId": "",
          "storageBucket": "",
          "authDomain": "",
          "measurementId": "",
        },
        "enablePaymentGateway": true,
        "enableAnalyticsIntegration": true,
        "razorpayConfig": {
          "apiKey": "",
          "secretKey": "",
        },
        "stripeConfig": {
          "publishableKey": "",
          "secretKey": "",
        },
      },
      "scheduledTasks": {
        "tasks": [''],
        "syncInterval": 300,
        "cleanupInterval": 600,
      }
    }
  };

  // Ensure the assets directory exists
  final directory = Directory('assets');
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
    print('Created directory: assets');
  }

  // Check if the config file already exists to avoid overwriting it
  final file = File(jsonConfigFilePath);
  file.writeAsStringSync(
    JsonEncoder.withIndent('  ').convert(defaultConfig),
  );
  print('JSON configuration file created at: $jsonConfigFilePath');
  // Write the YAML config file
  final yamlFile = File(yamlConfigFilePath);
  final yamlWriter = YamlWriter();
  final yamlContent = yamlWriter.write(defaultConfig);
  yamlFile.writeAsStringSync(yamlContent);
  print('YAML configuration file created at: $yamlConfigFilePath');
}
