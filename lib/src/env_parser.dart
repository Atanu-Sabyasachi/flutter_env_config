import 'dart:convert';

import 'package:yaml/yaml.dart';

class EnvParser {
  /// Parses the configuration file and returns a Dart map.
  /// Supports JSON and YAML formats.
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

  /// Converts a YamlMap to a Dart Map`<`String, dynamic`>`.
  static Map<String, dynamic> _yamlToMap(dynamic yamlMap) {
    if (yamlMap is YamlMap) {
      return yamlMap.map((key, value) => MapEntry(key.toString(), value));
    }
    throw Exception('Invalid YAML structure.');
  }
}
