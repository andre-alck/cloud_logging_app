import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Dado asset assets/secrets/service_account_key.json Quando verificado sua leitura Entao ?',
      () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    const path = 'assets/secrets/service_account_key.json';
    final file = await rootBundle.loadString(path);
    expect(file.isNotEmpty, true);
  });
}
