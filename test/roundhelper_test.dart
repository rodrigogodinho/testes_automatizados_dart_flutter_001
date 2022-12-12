import 'package:dart_testes_001/roundhelper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Arredonda um número 14.569 em 14.57 para duas casas de precisão', () {
    expect(RoundHelper.round(14.569, 2), equals(14.57));
  });
}
