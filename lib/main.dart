// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //////
//   //////Feribase
//   ///////////////////////////////////
//   late final dref = FirebaseDatabase.instance.reference();
//   late DatabaseReference databaseReference;
//   showData() {
//     dref.once().then((snapshot) => {print(snapshot.value)});
//   }

//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//     @override
//   void initState() {
//     super.initState();
//     databaseReference = dref;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
      //       FirebaseAnimatedList(
      //         shrinkWrap: true,
      //           query: databaseReference,
      //           itemBuilder: (BuildContext context, DataSnapshot snapshot,
      //               Animation animation, int index) {
      //             return Text(snapshot.value["Ejercicio1"].toString());
      //           }),
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton(
//             onPressed: showData,
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: _incrementCounter,
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
import 'package:fitcount_feribase/src/home_page.dart';
import 'package:fitcount_feribase/src/rutine_config.dart';
import 'package:fitcount_feribase/src/rutine_doing.dart';
import 'package:fitcount_feribase/src/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fitcount_feribase/src/principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home_page(),
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => Home_page(),
        'rutineConfig': (BuildContext context) => RutineConfig(),
        'rutineDoing': (BuildContext context) => RutineDoing(),
      },
    );
  }
}
