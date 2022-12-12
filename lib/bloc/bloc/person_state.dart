part of 'person_bloc.dart';

@immutable
abstract class PersonState {}

class PersonListState extends PersonState {
  final List<Person> data;
  PersonListState(this.data);
}

class PersonLoadingState extends PersonState {}

class PersonErrortate extends PersonState {
  final dynamic error;
  PersonErrortate([this.error]);
}
