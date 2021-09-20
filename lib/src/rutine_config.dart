import 'package:flutter/material.dart';


class RutineConfig extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 13, 13, 20),
          title: Text("Rutina piernas"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Exercise(),
            Exercise(),
            Exercise(),
            Exercise(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 211, 0, 50),
          onPressed: () {
          },
          child: Icon(
            Icons.add,
          ),
        ));
  }
}

class Exercise extends StatelessWidget {
  const Exercise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: FlutterLogo(),
            title: Text("Peso muerto"),
            subtitle: Text("Femorales/pierna/gluteos/pantorrilas"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Icon(Icons.create)),
              TextButton(onPressed: () {}, child: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
