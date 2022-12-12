import 'dart:convert';
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

  // método criado só para testar o timeout dos testes
  Future<int> get magicNumber async {
    return Future.delayed(
        Duration(seconds: 40), () => math.Random.secure().nextInt(2048));
  }

  String get isException {
    throw Exception('Olá, sou uma Exception');
  }

  // Método criado para testar skip de testes
  String get underConstruction {
    throw Exception(
        'Ops!!! Método em construção. Espera que logo, logo ele estará pronto!!!');
  }

  // Como o foco será aprender e testar recursos de teste automatizado
  // não serão criadas classes para separar a responsabilidade, como por exemplo
  // mappers para fazer a parte de mapear informação de JSON para entidade
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': surName,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      firstName: map['firstName'],
      surName: map['lastName'],
      age: map['age'],
      height: (map['height'] as int).toDouble(),
      weight: (map['weight'] as int).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
