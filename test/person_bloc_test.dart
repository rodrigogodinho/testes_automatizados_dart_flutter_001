import 'package:dart_testes_001/bloc/bloc/person_bloc.dart';
import 'package:dart_testes_001/model/person.dart';
import 'package:dart_testes_001/repository/person_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  late PersonRepository repository;
  late PersonBloc bloc;

  setUpAll(() {
    repository = PersonRepositoryMock();
    bloc = PersonBloc(repository);
  });

  test('Deve retornar uma lista de person', () async {
    final personA = Person(
        firstName: 'Rob', surName: 'Prueba', age: 39, height: 1.79, weight: 89);
    final personB = Person(
        firstName: 'Bob', surName: 'Test', age: 36, height: 1.79, weight: 89);

    when(() => repository.getPerson())
        .thenAnswer((invocation) async => <Person>[personA, personB]);

    bloc.add(PersonEventFetch());

    await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonListState>(),
        ]));
  });

  test('Deve retornar uma exception', () async {
    when(() => repository.getPerson()).thenThrow(Exception(
        'Algo se rompió aca hermano y no se donde empezar a vichar para arreglarlo!!!'));

    bloc.add(PersonEventFetch());

    await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonErrortate>(),
        ]));
  });
}
