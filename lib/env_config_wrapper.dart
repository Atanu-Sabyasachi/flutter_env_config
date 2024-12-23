import 'package:flutter/material.dart';
import 'package:flutter_env_config/flutter_env_config.dart';

/// A Flutter widget that listens to changes in the environment configuration
/// and rebuilds its child widget accordingly.
///
/// This widget uses a [ValueListenableBuilder] to listen for updates to the
/// [EnvironmentConfig], allowing you to display configuration-dependent
/// UI dynamically.
///
/// Example usage:
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
/// This is especially useful for scenarios where the configuration might be
/// reloaded at runtime and you want to reflect those changes in the UI.
class EnvConfigDisplay extends StatelessWidget {
  /// A builder function that provides the current [EnvironmentConfig]
  /// and the [BuildContext] for building UI.
  final Widget Function(
    BuildContext context,
    EnvironmentConfig config,
  ) builder;

  /// Creates an [EnvConfigDisplay] widget.
  ///
  /// The [builder] parameter must not be null.
  const EnvConfigDisplay({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<EnvironmentConfig>(
      /// Listens to the current configuration notifier and rebuilds when updated.
      valueListenable: EnvironmentManager().currentConfigNotifier,
      builder: (context, config, _) => builder(context, config),
    );
  }
}
