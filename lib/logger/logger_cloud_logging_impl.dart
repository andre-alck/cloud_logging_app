import 'package:cloud_logging_app/logger/logger.dart';
import 'package:googleapis/logging/v2.dart';

class LoggerCloudLoggingImpl implements Logger {
  final LoggingApi loggingApi;

  late final Map<String, String> jsonPayload;
  late final LogEntry logEntry;
  late final WriteLogEntriesRequest request;

  LoggerCloudLoggingImpl({required this.loggingApi});

  @override
  Future<void> log(String description) async {
    _prepareLog(description);
    _writeLog();
  }

  void _prepareLog(String description) {
    _prepareJsonPayload(description);
    _prepareLogData();
    _prepareRequest();
  }

  void _prepareJsonPayload(String description) {
    jsonPayload = {'message': description};
  }

  void _prepareLogData() {
    logEntry = LogEntry(
        logName: 'projects/cloud-logging-asac/logs/mylog',
        jsonPayload: jsonPayload,
        resource: MonitoredResource(type: 'global'),
        labels: {'isWeb': '0'});
  }

  void _prepareRequest() {
    request = WriteLogEntriesRequest(entries: [logEntry]);
  }

  void _writeLog() {
    loggingApi.entries.write(request);
  }
}
