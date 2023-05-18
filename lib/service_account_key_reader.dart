import 'package:cloud_logging_app/file_reader.dart';
import 'package:flutter/services.dart';

class ServiceAccountKeyReader implements FileReader {
  @override
  Future<String> read(String filePath) async {
    final file = await rootBundle.loadString(filePath);
    return file;
  }
}
