import 'package:dart_testes_001/person.dart';
import 'package:test/test.dart';

void main() {
  late Person person;

  setUpAll(() {
    print('Inicia suite');
    person = Person(
        firstName: "Rodrigo",
        surName: 'de Teste',
        age: 40,
        height: 1.79,
        weight: 89.6);
  });

  setUp(() {
    print('Inicia teste');
  });

  tearDown(() {
    print('Finaliza teste');
  });

  tearDownAll(() {
    print('Finaliza suite');
  });

  group('Idade', () {
    test('Maior de 18 anos é maior', (() {
      print('executa teste');
      expect(person.isOlder, isTrue);
    }));

    test('Igual 18 anos é maior', (() {
      final Person person = Person(
          firstName: "Rodrigo",
          surName: 'de Teste',
          age: 18,
          height: 1.78,
          weight: 89.6);
      print('executa teste');
      expect(person.isOlder, isTrue);
    }));
  });

  test('IMC deve ser 27.96', () {
    print('executa teste');
    expect(
        person.imc,
        allOf([
          isA<double>(),
          equals(27.96),
        ]));
  });

  test('FullName deve ser Rodrigo de Teste', () {
    expect(
        person.fullName,
        allOf([
          isNotNull,
          isA<String>(),
          equals('Rodrigo de Teste'),
        ]));
  });
}
