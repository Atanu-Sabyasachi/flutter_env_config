class ScheduledTasksConfig {
  final List<String> tasks;
  final int syncInterval;
  final int cleanupInterval;

  ScheduledTasksConfig({
    required this.tasks,
    required this.syncInterval,
    required this.cleanupInterval,
  });

  factory ScheduledTasksConfig.fromJson(Map<String, dynamic> json) {
    return ScheduledTasksConfig(
      tasks: List<String>.from(json['tasks']),
      syncInterval: json['syncInterval'],
      cleanupInterval: json['cleanupInterval'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tasks': tasks,
        'syncInterval': syncInterval,
        'cleanupInterval': cleanupInterval,
      };
}
