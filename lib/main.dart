import 'package:cloud_logging_app/file_reader/service_account_key_reader_impl.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/logging/v2.dart';
import 'package:googleapis_auth/auth_io.dart';

late final LoggingApi loggingApi;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final reader = ServiceAccountKeyReaderImpl();
  final conteudoDoArquivo =
      await reader.read('assets/secrets/service_account_key.json');

  final httpClient = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(
          String.fromCharCodes(conteudoDoArquivo.codeUnits)),
      [
        LoggingApi.loggingWriteScope,
      ]);

  loggingApi = LoggingApi(httpClient);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Oi!'),
      ),
    );
  }
}
