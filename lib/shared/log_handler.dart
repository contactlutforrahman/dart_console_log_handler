library console_log_handler.shared;

import "dart:convert";
import 'package:logging/logging.dart';
import 'dart:math';
import "package:intl/intl.dart";

part 'transformer.dart';

/// Is called after the console output is done
typedef void MakeConsoleGroup(final LogRecord logRecord);

/// prettyPrint for JSON
const JsonEncoder PRETTYJSON = const JsonEncoder.withIndent('   ');

abstract class LogHandler {
  static const String GROUP_STACK_TRACE = '  ○ StackTrace';
  static const String GROUP_OBJECT = '  ○ Dart-Object';

  void toConsole(final LogRecord logRecord, {TransformLogRecord transformer});
  void call(final LogRecord logRecord) => toConsole(logRecord);

  /// [groupName] is for example [GROUP_STACK_TRACE]
  void makeStackTraceGroup(final String groupName, final LogRecord logRecord);

  /// [groupName] is for example [GROUP_OBJECT]
  void makeObjectGroup(final String groupName, final LogRecord logRecord);

  /// Called after console output is done (via makeGroup - can be overwritten)
  void makeGroup(final LogRecord logRecord) {
    makeStackTraceGroup(GROUP_STACK_TRACE, logRecord);
    makeObjectGroup(GROUP_OBJECT, logRecord);
  }
}

String prettyPrintJson(final json) {
  return PRETTYJSON.convert(json);
}
