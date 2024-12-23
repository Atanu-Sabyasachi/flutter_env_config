import 'dart:convert';

import 'package:yaml/yaml.dart';

/// Parses configuration files in JSON or YAML format.
///
/// The `EnvParser` class provides a static method `parse` to load and parse
/// configuration data from files. It supports both JSON and YAML formats
/// and automatically detects the format if not explicitly provided.
class EnvParser {
  /// Parses the configuration file and returns a Dart map.
  ///
  /// Supports JSON and YAML formats. Automatically detects the format if
  /// [format] is not provided.
  ///
  /// - [fileContent]: The content of the configuration file as a string.
  /// - [format]: The format of the configuration file (`json` or `yaml`). If
  ///   `null`, the format is automatically detected based on the file content.
  ///
  /// Example usage (JSON):
  /// ```dart
  /// final jsonContent = '{"name": "MyApp", "version": "1.0.0"}';
  /// final config = EnvParser.parse(jsonContent);
  /// print(config['name']); // Output: MyApp
  /// ```
  ///
  /// Example usage (YAML):
  /// ```dart
  /// final yamlContent = 'name: MyApp\nversion: 1.0.0';
  /// final config = EnvParser.parse(yamlContent);
  /// print(config['name']); // Output: MyApp
  /// ```
  ///
  /// Throws:
  /// - [Exception] if the file content cannot be parsed or if the format is
  ///   unsupported.
  static Map<String, dynamic> parse(String fileContent, {String? format}) {
    try {
      // Determine the format (JSON/YAML) if not provided.
      if (format == null) {
        if (fileContent.trim().startsWith('{')) {
          format = 'json';
        } else if (fileContent.trim().contains(':')) {
          format = 'yaml';
        } else {
          throw Exception('Unsupported configuration file format.');
        }
      }

      // Parse JSON
      if (format.toLowerCase() == 'json') {
        return json.decode(fileContent) as Map<String, dynamic>;
      }

      // Parse YAML
      if (format.toLowerCase() == 'yaml') {
        final yamlMap = loadYaml(fileContent);
        return _yamlToMap(yamlMap);
      }

      throw Exception('Unsupported format: $format');
    } catch (e) {
      throw Exception('Error parsing configuration file: $e');
    }
  }

  /// Converts a [YamlMap] to a Dart [Map]<[String], dynamic>.
  ///
  /// This helper function recursively converts a YAML structure to a Dart
  /// map, handling nested maps and lists.
  ///
  /// Throws:
  /// - [Exception] if the YAML structure is invalid or cannot be converted.
  static Map<String, dynamic> _yamlToMap(dynamic yamlMap) {
    if (yamlMap is YamlMap) {
      return yamlMap.map((key, value) {
        if (value is YamlList) {
          return MapEntry(key.toString(), value.toList());
        } else if (value is YamlMap) {
          return MapEntry(key.toString(), _yamlToMap(value));
        } else {
          return MapEntry(key.toString(), value);
        }
      });
    } else if (yamlMap is YamlList) {
      return {'list': yamlMap.toList()};
    }
    throw Exception('Invalid YAML structure.');
  }
}
