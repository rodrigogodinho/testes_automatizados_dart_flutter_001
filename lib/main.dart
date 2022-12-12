import 'package:dart_testes_001/bloc/bloc/person_bloc.dart';
import 'package:dart_testes_001/bloc_provider.dart';
import 'package:dart_testes_001/home_page.dart';
import 'package:dart_testes_001/repository/person_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          bloc: PersonBloc(PersonRepository(Client())),
          child: const HomePage()),
    );
  }
}
