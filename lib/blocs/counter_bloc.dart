import 'dart:async';

class Counterbase {}

class Increment extends Counterbase {}

class Clear extends Counterbase {}

class CounterBloc {
  int _count = 0;

  StreamController<Counterbase> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<Counterbase> get senEvent => _input.sink;

  CounterBloc() {
    _input.stream.listen(onEvent);
  }

  void dispose() {
    _input.close();
    _output.close();
  }

  void onEvent(Counterbase event) {
    if (event is Increment) {
      _count++;
      print(_count);
    } else {
      _count = 0;
    }
    _output.add(_count);
  }
}
