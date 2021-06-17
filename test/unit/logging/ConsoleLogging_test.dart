@TestOn("browser")

library console_log_handler.unit.test.browser;

import 'package:dart_console_log_handler/dart_console_log_handler.dart';
import 'package:test/test.dart';

main() {
  final Logger _logger = new Logger("unit.test.Logging");
  configLogging(show: Level.OFF);

  group('Logging', () {
    setUp(() {});

    test('> Map', () {
      final Map<String, dynamic> map = {
        "firstname": "Mike",
        "lastname": "Mitterer {{var}}",
        "family": {"daughter": "Sarah", "age": 18}
      };

      _logger.info("Hallo", map);
    });
    // end of 'Map' test

    test('> StackTrace', () {
      try {
        throw "Sample for exception";
      } on String catch (error, stacktrace) {
        _logger.severe("Caught error", error, stacktrace);
      }
    }); // end of 'StackTrace' test
  });
  // end 'Logging' group
}
