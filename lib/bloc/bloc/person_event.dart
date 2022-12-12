part of 'person_bloc.dart';

@immutable
abstract class PersonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Evento para obter lista
class PersonEventFetch extends PersonEvent {}

// Evento para limpar lista
class PersonEventClear extends PersonEvent {}
