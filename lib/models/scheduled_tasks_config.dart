/// Represents the configuration for scheduled tasks.
///
/// This class encapsulates settings related to scheduled background tasks,
/// including a list of tasks to run and their respective intervals. It
/// provides methods for converting between JSON and Dart objects for data
/// persistence and serialization.
class ScheduledTasksConfig {
  /// Creates a [ScheduledTasksConfig] instance.
  ///
  /// All parameters are required:
  ///
  /// *   [tasks]: A list of task names or identifiers.
  /// *   [syncInterval]: The interval (in milliseconds) at which synchronization
  ///     tasks should run.
  /// *   [cleanupInterval]: The interval (in milliseconds) at which cleanup
  ///     tasks should run.
  ScheduledTasksConfig({
    required this.tasks,
    required this.syncInterval,
    required this.cleanupInterval,
  });

  /// Creates a [ScheduledTasksConfig] instance from a JSON map.
  ///
  /// This factory constructor parses a JSON map and creates a corresponding
  /// [ScheduledTasksConfig] object. It expects the JSON map to contain the
  /// keys 'tasks', 'syncInterval', and 'cleanupInterval'. The 'tasks' value
  /// should be a JSON array of strings.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "tasks": ["syncData", "uploadLogs", "processQueue"],
  ///   "syncInterval": 300000, // 5 minutes
  ///   "cleanupInterval": 86400000 // 24 hours
  /// }
  /// ```
  ///
  /// Throws a [TypeError] if the provided JSON values are not of the expected
  /// types.
  factory ScheduledTasksConfig.fromJson(Map<String, dynamic> json) {
    return ScheduledTasksConfig(
      tasks: List<String>.from(json['tasks']),
      syncInterval: json['syncInterval'] as int,
      cleanupInterval: json['cleanupInterval'] as int,
    );
  }

  /// A list of task names or identifiers.
  ///
  /// These strings represent the specific tasks that should be scheduled.
  final List<String> tasks;

  /// The interval (in milliseconds) at which synchronization tasks should run.
  ///
  /// This value determines how often data synchronization occurs.
  final int syncInterval;

  /// The interval (in milliseconds) at which cleanup tasks should run.
  ///
  /// This value determines how often cleanup operations are performed (e.g.,
  /// deleting old data or logs).
  final int cleanupInterval;

  /// Converts this [ScheduledTasksConfig] instance to a JSON map.
  ///
  /// This method serializes the [ScheduledTasksConfig] object into a JSON
  /// representation that can be easily stored or transmitted.
  ///
  /// Returns a [Map] containing the 'tasks', 'syncInterval', and
  /// 'cleanupInterval' keys and their corresponding values.
  Map<String, dynamic> toJson() => {
        'tasks': tasks,
        'syncInterval': syncInterval,
        'cleanupInterval': cleanupInterval,
      };
}
