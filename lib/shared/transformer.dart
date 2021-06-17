part of console_log_handler.shared;

/// Converts [LogRecord] to String
typedef String TransformLogRecord(final LogRecord logRecord);

String transformerDefault(final LogRecord logRecord,
    {final int nameWidth = 20}) {
  final dateFormat = new DateFormat("HH:mm:ss.SSS");

  String loggerName = logRecord.loggerName
      .substring(max(0, logRecord.loggerName.length - nameWidth));
  String shortLoggerName =
      logRecord.loggerName.replaceAll(new RegExp('^.+\\.'), "");

  String time;
  if (logRecord.time != null) {
    time = dateFormat.format(logRecord.time);
  } else {
    time = dateFormat.format(new DateTime.now());
  }

  if (loggerName.length > nameWidth) {
    loggerName = shortLoggerName;
  }
  loggerName += ":";
  loggerName = loggerName.padRight(nameWidth);

  if (logRecord.error != null) {
    return "$time [${logRecord.level}] ${loggerName} ${logRecord.message} / ${logRecord.error}";
  } else {
    return "$time [${logRecord.level}] ${loggerName} ${logRecord.message}";
  }
}

String transformerSimple(final LogRecord logRecord) {
  String shortLoggerName =
      logRecord.loggerName.replaceAll(new RegExp(r'^.+[.]'), "");

  if (logRecord.error != null) {
    return "${shortLoggerName}: ${logRecord.message} / ${logRecord.error}";
  } else {
    return "${shortLoggerName}: ${logRecord.message}";
  }
}

String transformerMessageOnly(final LogRecord logRecord) {
  if (logRecord.error != null) {
    return "${logRecord.message} / ${logRecord.error}";
  } else {
    return "${logRecord.message}";
  }
}
