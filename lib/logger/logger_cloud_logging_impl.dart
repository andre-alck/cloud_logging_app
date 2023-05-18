import 'package:cloud_logging_app/logger/logger.dart';
import 'package:googleapis/logging/v2.dart';

class LoggerCloudLoggingImpl implements Logger {
  final LoggingApi loggingApi;

  LoggerCloudLoggingImpl({required this.loggingApi});

  @override
  Future<void> log(String description) async {
    final Map<String, String> params = {'message': description};
    final logEntry = LogEntry(
        logName: 'projects/cloud-logging-asac/logs/mylog',
        jsonPayload: params,
        resource: MonitoredResource(type: 'global'),
        labels: {'isWeb': '0'});
    final req = WriteLogEntriesRequest(entries: [logEntry]);
    loggingApi.entries.write(req);
  }
}
