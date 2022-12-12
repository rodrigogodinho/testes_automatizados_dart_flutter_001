import 'package:dart_testes_001/bloc/bloc/person_bloc.dart';
import 'package:dart_testes_001/bloc_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pessoas'),
        actions: [
          StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {
              final isEnable = bloc.state is PersonListState &&
                  (bloc.state as PersonListState).data.isNotEmpty;
              return IconButton(
                icon: Icon(Icons.delete),
                onPressed: isEnable ? () => bloc.add(PersonEventClear()) : null,
              );
            },
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stream,
          builder: (context, snapshot) {
            if (bloc.state is PersonErrortate) {
              return _ErrorWidget();
            } else if (bloc.state is PersonLoadingState) {
              return CircularProgressIndicator();
            } else {
              return _ListWidget();
            }
          },
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final String textError =
        (bloc.state as PersonErrortate).error?.toString() ?? "";
    return Text(textError);
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final listPerson = (bloc.state as PersonListState).data;

    if (listPerson.isEmpty) {
      return TextButton(
        child: Text('Obter dados'),
        onPressed: () {
          bloc.add(PersonEventFetch());
        },
      );
    }
    return ListView.builder(
      itemCount: listPerson.length,
      itemBuilder: (context, index) {
        final item = listPerson[index];
        return ListTile(
          title: Text(item.fullName),
          subtitle: Text('Age: ${item.age}'),
        );
      },
    );
  }
}
