/// Represents the various environments that can be used in the application.
///
/// This enum is typically used to distinguish between different configurations
/// such as development, staging, and production environments.
///
/// Example usage:
/// ```dart
/// Environment currentEnvironment = Environment.dev;
/// switch (currentEnvironment) {
///   case Environment.dev:
///     print("Development environment selected.");
///     break;
///   case Environment.staging:
///     print("Staging environment selected.");
///     break;
///   case Environment.prod:
///     print("Production environment selected.");
///     break;
/// }
/// ```
enum Environment {
  /// Represents the development environment.
  dev,

  /// Represents the staging environment.
  staging,

  /// Represents the production environment.
  prod,
}
