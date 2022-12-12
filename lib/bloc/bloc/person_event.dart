part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

// Evento para obter lista
class PersonEventFetch extends PersonEvent {}

// Evento para limpar lista
class PersonEventClear extends PersonEvent {}
