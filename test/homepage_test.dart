// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dart_testes_001/bloc/bloc/person_bloc.dart';
import 'package:dart_testes_001/bloc_provider.dart';
import 'package:dart_testes_001/home_page.dart';
import 'package:dart_testes_001/model/person.dart';
import 'package:dart_testes_001/repository/person_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  late PersonRepository repository;
  late PersonBloc bloc;

  setUpAll(() {
    repository = PersonRepositoryMock();
    bloc = PersonBloc(repository);
  });

  tearDownAll(() {
    bloc.close();
  });

  testWidgets('Deve mostrar lista de pessoas na tela',
      (WidgetTester tester) async {
    final personA = Person(
        firstName: 'Rob', surName: 'Prueba', age: 39, height: 1.79, weight: 89);
    final personB = Person(
        firstName: 'Bob', surName: 'Test', age: 36, height: 1.79, weight: 89);

    when(() => repository.getPerson()).thenAnswer((invocation) async {
      return <Person>[personA, personB];
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(bloc: bloc, child: HomePage()),
      ),
    );

    final textButton = find.byType(TextButton);
    final listView = find.byType(ListView);

    expect(textButton, findsOneWidget);
    expect(listView, findsNothing);

    await tester.tap(textButton);
    await tester.runAsync(() => bloc.stream.first);
    await tester.pump();
    expect(textButton, findsNothing);
    expect(listView, findsOneWidget);
  });
}
