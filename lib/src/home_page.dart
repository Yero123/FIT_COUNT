import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fitcount_feribase/src/principal.dart';

import 'package:fitcount_feribase/blocs/color_bloc.dart';
import 'package:fitcount_feribase/blocs/counter_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  
  final CounterBloc _counterBloc = CounterBloc();
  final ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 13, 13, 20),
        title: Text("Fitcount"),
        centerTitle: true,
      ),
      body: Principal(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 211, 0, 50),
        onPressed: () => createRutine(context),
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq),
              title: Text("Home"),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Home"),
              backgroundColor: Colors.blueGrey)
        ],
      ),
    );
  }
}

createRutine(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Rutina nueva"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("Nombre de la rutina :"),
                  ],
                ),
                Text("Contenido para que se pueda estirar todo lo que pueda")
              ],
            ),
          ));
}

//PasedeColor(colorBloc: colorBloc, counterBloc: _counterBloc);
class PasedeColor extends StatelessWidget {
  const PasedeColor({
    Key? key,
    required this.colorBloc,
    required CounterBloc counterBloc,
  })   : _counterBloc = counterBloc,
        super(key: key);

  final ColorBloc colorBloc;
  final CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: StreamBuilder<MaterialColor>(
            initialData: Colors.amber,
            stream: colorBloc.colorStream,
            builder: (context, snapshot) {
              return Container(
                color: snapshot.data,
                child: StreamBuilder<int>(
                    stream: _counterBloc.counterStream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Text('color : ${snapshot.data}');
                    }),
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.senEvent.add(Increment());
              colorBloc.colorEvent.add(ColorRojo());
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.senEvent.add(Increment());
              colorBloc.colorEvent.add(ColorAmarillo());
            },
          ),
        ],
      ),
    );
  }
}
