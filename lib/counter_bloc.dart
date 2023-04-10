import 'dart:async';

enum CounterEvent { decrement, increment }

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;

  void add(CounterEvent event) {
    switch (event) {
      case CounterEvent.increment:
        _emit(_counter + 1);
        break;
      case CounterEvent.decrement:
        _emit(_counter - 1);
        break;
    }
  }

  void _emit(int newCounter) {
    if (newCounter != _counter) {
      _counter = newCounter;
      _controller.add(_counter);
    }
  }

  void dispose() {
    _controller.close();
  }
}
