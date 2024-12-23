<a href="https://www.buymeacoffee.com/AtanuSabyasachi"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=AtanuSabyasachi&button_colour=FFDD00&font_colour=000000&font_family=Poppins&outline_colour=000000&coffee_colour=ffffff" />
</a>

# Flutter Env Config

A powerful and flexible environment configuration management package for Flutter projects. This package simplifies managing and switching between multiple environment configurations (e.g., `dev`, `staging`, `prod`) and allows runtime updates, making it ideal for scalable applications.

## Features

- Load environment configurations from JSON or YAML files.
- Dynamic configuration updates at runtime using `ValueNotifier`.
- Centralized environment management with a singleton pattern.
- Supports CI/CD configurations, API settings, theming, analytics, and more.
- Easy-to-use methods for testing and environment overrides.

**General Configurations**:
- Define environments such as dev, staging, and prod.
- Access environment-specific settings like name, api, and features.
```json
  "dev": {
    "environment": "dev",
    "name": "Development"
  }
```

**API Settings**:
- Configure the base URL and timeout for API calls.
```json
  "api": {
      "baseUrl": "https://dev.api.com",
      "timeout": 30000
    }
```

**CI/CD Integration**:
- Add CI/CD variables like API keys and database URLs.
- Track builds with buildId, branchName, and commitHash.
- Set up deployment settings, including rollback on failure.
- Enable unit, integration, and end-to-end tests with threshold configurations.
```json
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
        "url": ""
      },
      "testing": {
        "runUnitTests": true,
        "coverageThreshold": 70,
        "testingFramework": "",
        "enableUnitTests": false,
        "enableIntegrationTests": false,
        "enableE2ETests": false
      }
    }
```

**Feature Toggles**:
- Enable or disable beta features dynamically.
- Use feature flags to control app features at runtime.
```json
"features": {
      "enableBetaFeatures": true,
      "featureFlag": true,
      "featureOneEnabled": false,
      "featureTwoEnabled": false
    }
```

**Logging**:
- Manage application logging with options for log levels (debug, info, etc.).
- Enable or disable logging.
```json
"logging": {
      "logLevel": "debug",
      "enableLogging": true
    }
```

**Security**:
- Enable encryption for sensitive data.
- Support secure storage and SSL pinning.
```json
"security": {
      "enableEncryption": true,
      "encryptionKey": "",
      "enableSecureStorage": true,
      "sslPinning": false
    }
```

**Analytics**:
- Configure analytics with API keys.
- Enable or disable user tracking.
```json
"analytics": {
      "enableAnalytics": true,
      "apiKey": "DEV_ANALYTICS_KEY",
      "enableTracking": true
    }
```

**Localization**:
- Set a default locale (e.g., en) and define supported locales (e.g., en, fr, es).
```json
"localization": {
      "defaultLocale": "en",
      "supportedLocales": [
        "en",
        "fr",
        "es"
      ]
    }
```

**Theming**:
- Define primary and secondary colors for the app.
- Customize fonts with a specified font family.
```json
"theming": {
      "primaryColor": "#FF5733",
      "secondaryColor": "#33FF57",
      "fontFamily": "Roboto"
    }
```

**Third-Party Integrations**:
- Integrate Firebase with options like apiKey, projectId, and authDomain.
- Support payment gateways like Razorpay and Stripe.
```json
"thirdPartyServices": {
      "firebaseConfig": {
        "apiKey": "DEV_FIREBASE_KEY",
        "projectId": "dev-project-id",
        "appId": "",
        "messagingSenderId": "",
        "storageBucket": "",
        "authDomain": "",
        "measurementId": ""
      },
      "enablePaymentGateway": true,
      "enableAnalyticsIntegration": true,
      "razorpayConfig": {
        "apiKey": "",
        "secretKey": ""
      },
      "stripeConfig": {
        "publishableKey": "",
        "secretKey": ""
      }
    }
```

**Scheduled Tasks**:
- Automate sync and cleanup tasks with defined intervals.
```json
"scheduledTasks": {
      "tasks": [],
      "syncInterval": 300,
      "cleanupInterval": 600
    }
```

## How to Use
Follow these steps to seamlessly integrate environment-specific configurations into your Flutter app:

- **Install the Package**

  Add the package to your `pubspec.yaml`:
```yaml
dependencies:  
  flutter_env_config: <latest-version> 
``` 
- **Generate Config Files**

  Run the following command in your terminal:
```yaml
generate-config
```  
  This will create an `assets` folder in your project with two files:

  `config.json` & `config.yaml`

- **Register Assets**

  Include the `assets` folder in your pubspec.yaml:

```yaml
flutter:  
  assets:  
    - assets/  
```
- **Initialize Before runApp**

  Set up the configuration during app startup before runApp():

```dart
await FlutterEnvConfig.init(  
  configFile: 'assets/config.json',  
  targetEnvironment: Environment.dev,  
);
runApp(MyApp());
```
- **Access Configuration**

  Easily access the environment data anywhere in your app:

```dart
EnvironmentConfig config = EnvironmentManager.environmentData;
``` 
📝 **Notes**

If the assets folder is newly generated, rerun your app to load the files.
Modify values in config.json or config.yaml as needed, but rerun the app afterward to apply changes.

## Contributing
Contributions are welcome! If you find bugs or have feature suggestions, feel free to create an issue or submit a pull request. Make sure to follow the contribution guidelines.

- Report bugs and request features via [GitHub Issues](https://github.com/Atanu-Sabyasachi/flutter_env_config/issues)
- Engage in discussions and help users solve their problems/questions in the [Discussions](https://github.com/discussions)

## License
This package is licensed under the MIT License. See the LICENSE file for more details.

Happy coding! 🎉

This `README.md` covers installation, usage, features, property descriptions, and customization, making it beginner-friendly and informative for all users of the package.

-------------------------------------------------------------

**Version**: 1.0.2  
**Author**: Atanu Sabyasachi Jena  
**License**: MIT
