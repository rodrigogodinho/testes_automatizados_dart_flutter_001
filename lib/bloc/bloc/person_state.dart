part of 'person_bloc.dart';

@immutable
abstract class PersonState {}

// Estado para apresentar lista
class PersonListState extends PersonState {
  final List<Person> data;
  PersonListState(this.data);
}

// Estado de loading
class PersonLoadingState extends PersonState {}

// Estado de erro
class PersonErrortate extends PersonState {
  final dynamic error;
  PersonErrortate([this.error]);
}
