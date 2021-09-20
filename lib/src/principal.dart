import 'package:flutter/material.dart';
import 'package:fitcount_feribase/src/rutine_config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bottom_navigation_bar/bottom_navigation_bar.dart';

class Principal extends StatelessWidget {
  const Principal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Rutine(), Rutine(), Rutine(), Rutine(), Rutine()],
    );
  }
}

class Rutine extends StatelessWidget {
  const Rutine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: Rutina(),
      ),
      actions: <Widget>[
        IconSlideAction(
            caption: 'Do it',
            color: Colors.yellowAccent,
            icon: Icons.play_arrow_outlined,
            onTap: () => {Navigator.pushNamed(context, "rutineDoing")}),
        IconSlideAction(
            caption: 'Config',
            color: Colors.blueAccent,
            icon: Icons.create,
            onTap: () => {Navigator.pushNamed(context, "rutineConfig")}),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {}),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'More',
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () => {}),
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {}),
      ],
    );
  }
}

class Rutina extends StatelessWidget {
  const Rutina({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.purple,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
              leading: FlutterLogo(),
              title: Text("Rutinas piernas"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Curl sentado/Peso "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "rutineDoing");
                      },
                      child: Icon(Icons.play_arrow))
                ],
              )),
        ],
      ),
    );
  }
}
