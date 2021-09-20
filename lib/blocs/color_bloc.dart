import 'dart:async';

import 'package:flutter/material.dart';

abstract class ColorEvent {}

class ColorRojo extends ColorEvent {}

class ColorAmarillo extends ColorEvent {}

class ColorBloc {
  StreamController<ColorEvent> inputColor = StreamController();
  StreamController<MaterialColor> outputColor = StreamController();

  Stream<MaterialColor> get colorStream => outputColor.stream;
  StreamSink<ColorEvent> get colorEvent => inputColor.sink;

  var color = Colors.blue;
  ColorBloc() {
    inputColor.stream.listen(cargarcolor);
  }
  void dispose() {
    inputColor.close();
    outputColor.close();
  }

  void cargarcolor(ColorEvent event) {
    if (event is ColorRojo) {
      color = Colors.red;
    } else {
      color = Colors.yellow;
    }
    outputColor.add(color);
  }
}
