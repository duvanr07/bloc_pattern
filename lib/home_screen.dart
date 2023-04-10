import 'package:bloc_pattern/counter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 70);
    final _bloc = CounterBloc();

    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.stream,
          initialData: _bloc.counter,
          builder: (_, AsyncSnapshot snapshot) {
            return Text(
              '${snapshot.data}',
              style: style,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(CounterEvent.decrement);
            },
            child: const Icon(Icons.remove_circle_outline_rounded),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(CounterEvent.increment);
            },
            child: const Icon(Icons.plus_one_sharp),
          ),
        ],
      ),
    );
  }
}
