import 'dart:io';
import 'dart:math' as math;

import 'package:dart_testes_001/roundhelper.dart';

class Person {
  final String firstName;
  final String surName;
  final int age;
  final double height;
  final double weight;

  Person(
      {required this.firstName,
      required this.surName,
      required this.age,
      required this.height,
      required this.weight});

  double get imc {
    final double imc = weight / (math.pow(height, 2));
    return RoundHelper.round(imc, 2);
  }

  bool get isOlder {
    return age >= 18;
  }

  String get fullName {
    return '$firstName $surName';
  }

  // método creado só para testar o timeout dos testes
  Future<int> get magicNumber async {
    return Future.delayed(
        Duration(seconds: 40), () => math.Random.secure().nextInt(2048));
  }
}
