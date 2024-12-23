import 'package:flutter/material.dart';
import 'package:flutter_env_config/flutter_env_config.dart';

/// A Flutter widget that dynamically displays environment configuration information
/// based on changes in the current environment.
///
/// This widget is particularly useful for scenarios where your application's
/// UI needs to adapt to different environment configurations (dev, staging, prod).
/// It utilizes a [ValueListenableBuilder] to listen for updates to the
/// [EnvironmentConfig] provided by the [EnvironmentManager] class.
///
/// By providing a builder function, you can define how the UI should be
/// constructed based on the current environment settings. This allows for
/// flexible and dynamic UI updates based on configuration changes.
///
/// Example usage:
///
/// ```dart
/// EnvConfigDisplay(
///   builder: (context, config) {
///     return Column(
///       children: [
///         Text('Environment: ${config.name}'),
///         Text('API URL: ${config.api?.baseUrl}'),
///       ],
///     );
///   },
/// );
/// ```
///
/// In this example, the builder function displays the current environment name
/// and the base URL retrieved from the `api` section of the configuration.
/// You can customize the builder function to display any relevant information
/// and create a dynamic UI based on the configuration data.
class EnvConfigDisplay extends StatelessWidget {
  /// A builder function that receives the current [BuildContext], the
  /// [EnvironmentConfig] object, and a dummy argument (`_`) provided by
  /// [ValueListenableBuilder]. You can use the `config` object to access
  /// environment-specific settings and build the UI accordingly.
  ///
  /// This parameter is mandatory and must not be null.
  final Widget Function(
    BuildContext context,
    EnvironmentConfig config,
  ) builder;

  /// Creates an [EnvConfigDisplay] widget.
  ///
  /// - [builder]: The required builder function that defines the UI based on
  ///             the current environment configuration.
  const EnvConfigDisplay({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<EnvironmentConfig>(
      /// Listens to the current configuration notifier provided by
      /// [EnvironmentManager]. Whenever the configuration changes, the builder
      /// function will be called to rebuild the widget with the updated data.
      valueListenable: EnvironmentManager().currentConfigNotifier,
      builder: (context, config, _) => builder(context, config),
    );
  }
}
