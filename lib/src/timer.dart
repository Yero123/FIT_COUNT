import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:timezone/timezone.dart' as tz;

//import 'package:progress_indicator/progress_indicator.dart';

class Timer2 extends StatefulWidget {
  final double message;
  final double message2;
  Timer2({Key? key, required this.message, required this.message2})
      : super(key: key);

  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<Timer2>
    with SingleTickerProviderStateMixin {
  // 45 -> TIEMPO DE ENFOQUE
  // 20 -> TIEMPO DE DESCANSO
  //int get a => widget.message;
  //Duration time_trabajo = Duration(minutes: a);

  //AnimationController animationController;
  Duration time_trabajo = Duration(minutes: 25);
  Duration time_descanso = Duration(minutes: 5); //= Duration(minutes: 20);
  Duration time_1 = Duration(minutes: 5); //= Duration(minutes: 45);
  double puntos = 0;
  String frace = "Mantente en Flow";
  int desenf = 0;
  int down = 0;
  double val = 1;
  int flac = 0;
  int tiempo_enfoque = 5;
  double get percent => val;
  Duration get time => time_1;
  int get minutes => time_1.inMinutes.remainder(1000);
  int get seconds => time_1.inSeconds.remainder(60);
  int get ptj_d => desenf;
  double get points => puntos;
  String get format =>
      "${minutes < 10 ? "0" : ""}$minutes:${seconds < 10 ? "0" : ""}$seconds";

  String get format2 => "Puntaje : ${points.toStringAsFixed(2)}pts";
  String get format3 => frace;
  TextStyle estiloTexto = new TextStyle(fontSize: 50, color: Colors.white);
  int _sec = 0;
  int _min = 0;
  int _counter = 0;
  int bandera = 0;
  int bandera2 = 0;
  int time_10 = 0;
  int vida = 3;
  int cuenta = 0;
  var lima;
  @override
  void dispose() {
    flac = 1;
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      timer.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Text(frace),
              elevation: 2.5,
              centerTitle: true,
              leading: new IconButton(
                icon: new Icon(Icons.ac_unit),
                onPressed: () {
                  /*setState(() {
                    flac = 1;
                  });
                  Timer.periodic(Duration(milliseconds: 1000), (timer) {
                    timer.cancel();
                  });*/
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.transparent),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.0,
                height: 10.0,
              ),
              /*Container(
                child: Image.asset(
                  'assets/1.png',
                  width: 300,
                  height: 150,
                ),
              ),*/
              SizedBox(
                width: 30.0,
                height: 30.0,
              ),
              CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 5.0,
                percent: percent,
                center: new Text(
                  format,
                  style: estiloTexto,
                ),
                //center: TimerTest(),
                progressColor: Colors.white,
              ),
              SizedBox(
                width: 30.0,
                height: 20.0,
              ),
              //_vidas(),
              SizedBox(
                width: 30.0,
                height: 50.0,
              ),
              _crearBotones()
            ],
          )),
          //floatingActionButton: _crearBotones(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        )); //Scaffold -> Dise ño de la pantalla
  }

  Widget _crearBotones() {
    if (bandera == 1) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.0,
            ),
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: _low,
              child: Icon(Icons.warning_rounded, color: Colors.blue),
              backgroundColor: Colors.white,
            ),
            Expanded(child: SizedBox(width: 10.0)),
            FloatingActionButton(
                heroTag: "btn2",
                onPressed: _pause,
                child: Icon(Icons.pause, color: Colors.blue),
                backgroundColor: Colors.white),
            SizedBox(
              width: 100.0,
            ),
          ]);
    }
    if (bandera == 2) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.0,
            ),
            FloatingActionButton(
                heroTag: "btn3",
                onPressed: _stop,
                child: Icon(Icons.stop, color: Colors.blue),
                backgroundColor: Colors.white),
            Expanded(child: SizedBox(width: 10.0)),
            //FloatingActionButton(onPressed: _pause, child: Icon(Icons.pause)),
            //SizedBox(width: 5.0),
            FloatingActionButton(
                heroTag: "btn4",
                onPressed: _agregar,
                child: Icon(Icons.play_arrow, color: Colors.blue),
                //color : Colors.blue,
                backgroundColor: Colors.white),
            SizedBox(
              width: 100.0,
            ),
          ]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      FloatingActionButton(
          heroTag: "btn5",
          onPressed: _agregar,
          child: Icon(
            Icons.play_arrow,
            color: Colors.blue,
          ),
          backgroundColor: Colors.white)
    ]);
    //return FloatingActionButton(onPressed: null,child: Icon(Icons.add_alarm));
  }

  void initState() {
    time_trabajo = Duration(minutes: widget.message.toInt());
    time_descanso = Duration(minutes: widget.message2.toInt());
    time_1 = Duration(minutes: widget.message.toInt());
    down = 0;
    if (!mounted) return;
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      print('bandera: $bandera');
      //puntos++;
      //timer.cancel();
      if (flac == 1) {
        timer.cancel();
      }
      time_10++;
      if (time_descanso.inMinutes.remainder(60).toDouble() +
              time_descanso.inSeconds.remainder(60).toDouble() ==
          0) {
        //_agregar();
      } else {
        if (bandera == 2) if (this.mounted) {
          setState(updateTimeDescanso);
        } //--> AQUI HAY UN ERROR RARO Q NO HABIA ANTES
      }
      if (time_trabajo.inMinutes.remainder(10000).toDouble() +
              time_trabajo.inSeconds.remainder(60).toDouble() ==
          0) {
        _stop();
      }
      int press;

      if (bandera == 1) {
        //puntos += 0.5 - 0.05 * down;

        if (down >= 1) {
          cuenta++;
          //print(cuenta);
          if (cuenta >= tiempo_enfoque * 60) {
            if (vida < 3) vida++;
            if (vida == 3) down = 0;
            cuenta = 0;
          }
          /*if (cuenta < 3 * 60 && down >= 2) {
            cuenta = 0;
            //vida--;
          }*/
        }
        if (this.mounted) {
          setState(updateTimeWork);
        }
      }
      //if (bandera == 2) setState(updateTimeDescanso);
      if (bandera == 3) ;
      if (time_10 == 5 * 60) {
        time_10 = 0;
        if (vida < 3) vida++;
      }
      //bandera2--;
      if (bandera2 == 1) {
      } else {
        bandera2--;
        if (bandera2 == 5) ;
      }
      ;
    });
    /*animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {});s
    });

    animationController.repeat();*/
    super.initState();
  }

  updateTimeWork() {
    //val -= time_trabajo / (60);
    time_trabajo = time_trabajo - Duration(seconds: 1);
    val = (time_trabajo.inMinutes.remainder(10000).toDouble() * 60 +
            time_trabajo.inSeconds.remainder(60).toDouble()) /
        (widget.message * 60);
    time_1 = time_trabajo;
  }

  updateTimeDescanso() {
    time_descanso = time_descanso - Duration(seconds: 1);
    val = (time_descanso.inMinutes.remainder(10000).toDouble() * 60 +
            time_descanso.inSeconds.remainder(60).toDouble()) /
        (widget.message2 * 60);
    time_1 = time_descanso;
  }

  void _agregar() {
    /*Map<String, dynamic> demoData = {
      "hora_fin": Timestamp.now(),
      "hora_inicial": Timestamp.now()
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Enfoquev2');
    collectionReference.add(demoData);*/
    if (this.mounted) {
      setState(() {
        //time_1 = Duration(minutes: 45);
        bandera = 1;
      });
    }
  }

  void _pause() {
    //tiempo_llegada.hashCode;
    /*Map<String, dynamic> demoData = {
      "hora_fin": Timestamp.now(),
      "hora_inicio": tiempo_llegada
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Enfoquev2');
    collectionReference.add(demoData);*/
    //America/Lima
    /*final intTemp = DBProvider.db.nuevoScan(TimeWork2(
        horaInicial: tiempo_llegada.toString(),
        horaFinal: tz.TZDateTime.now(lima).toString()));*/
    //DBProvider.db.getTodosLosScans().then((print));
    //print(DBProvider.db.deleteAllScans());
    if (this.mounted) {
      setState(() {
        //time_1 = Duration(minutes: 20);
        bandera = 2;
        vida = 3;
      });
    }
  }

  void _stop() {
    if (this.mounted) {
      setState(() {
        time_1 = Duration(minutes: widget.message.toInt());
        time_trabajo = Duration(minutes: widget.message.toInt());
        time_descanso = Duration(minutes: widget.message2.toInt());
        val = 1;
        bandera = 3;
      });
    }
  }

  void _low() {
    if (this.mounted) {
      setState(() {
        down++;
        desenf++;
        if (vida > 1) vida--;
        if (cuenta < 3 * 60 && down >= 2) {
          cuenta = 0;
        }
      });
    }
  }

  void _reset() {
    if (this.mounted) {
      setState(() {
        _counter--;
      });
    }
  }

  void _incrementCounter() {
    if (this.mounted) {
      setState(() {
        _counter++;
      });
    }
  }
}
