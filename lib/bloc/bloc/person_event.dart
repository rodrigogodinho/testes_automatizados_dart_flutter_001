part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

class PersonEventFetch extends PersonEvent {}

class PersonEventClear extends PersonEvent {}
