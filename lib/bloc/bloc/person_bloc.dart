import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:dart_testes_001/model/person.dart';
import 'package:dart_testes_001/repository/person_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;
  PersonBloc(this.repository) : super(PersonListState([])) {
    on<PersonEventClear>((event, emit) {
      emit(PersonListState([]));
    });
    on<PersonEventFetch>((event, emit) async {
      emit(PersonLoadingState());
      try {
        final list = await repository.getPerson();
        emit(PersonListState(list));
      } catch (e) {
        emit(PersonErrortate(e));
      }
    });
  }
}
