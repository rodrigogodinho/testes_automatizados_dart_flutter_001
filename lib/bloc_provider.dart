import 'package:dart_testes_001/bloc/bloc/person_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final PersonBloc bloc;

  const BlocProvider({
    super.key,
    required this.child,
    required this.bloc,
  }) : super(child: child);

  final Widget child;

  static BlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return oldWidget.bloc.state != bloc.state;
  }

  static PersonBloc get(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<BlocProvider>();
    if (provider != null) {
      return provider.bloc;
    } else {
      throw Exception('Não foi possível recuperar o bloc');
    }
  }
}
