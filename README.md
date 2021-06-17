# dart_console_log_handler

A dart package to show your log messages in browser console. From now, you can see your dart log messages in the browser.

## How to use it
```dart
library unit.test;

import 'package:logging/logging.dart';

// Browser
import "package:dart_console_log_handler/dart_console_log_handler.dart";

// Commandline
import "package:dart_console_log_handler/print_log_handler.dart";

void main() {
    configLogging(show: Level.INFO, transformer: transformerMessageOnly);
    final Logger _logger = new Logger("test");

    try {
        throw "Sample for exception";
    } on String catch( error, stacktrace) {

        _logger.severe("Caught error",error,stacktrace);
    }

}

```