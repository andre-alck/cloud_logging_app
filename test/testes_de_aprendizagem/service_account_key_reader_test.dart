import 'package:cloud_logging_app/file_reader/service_account_key_reader_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Dado asset assets/secrets/service_account_key.json Quando verificado sua leitura Entao deve verificar se o conteúdo não está vazio',
      () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final reader = ServiceAccountKeyReaderImpl();

    final conteudoDoArquivo =
        await reader.read('assets/secrets/service_account_key.json');
    expect(conteudoDoArquivo.isNotEmpty, true);
  });
}
