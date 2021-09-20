import 'package:fitcount_feribase/src/timer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class RutineDoing extends StatefulWidget {
  @override
  _RutineDoingState createState() => _RutineDoingState();
}

class _RutineDoingState extends State<RutineDoing> {
  late final _dref = FirebaseDatabase.instance.reference();

  late DatabaseReference databaseReference;
  String _ejercicios = "no leyo uu";

  showData() {
    _dref.once().then((snapshot) => {print(snapshot.value)});
  }

  @override
  void initState() {
    super.initState();
    _activeListeners();
    databaseReference = _dref;
  }

  void _activeListeners() { 
    _dref.child('InfoApp/Ejercicio1/Set1').onValue.listen((event) {
      final String ejercicioslis = event.snapshot.value.toString();
      setState(() {
        _ejercicios =" ha ya $ejercicioslis";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 13, 13, 20),
          title: Text("Rutina piernas"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Exercise(),
              ExerciceInput(),
              JumpExercice(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (valor) {}),
                  Checkbox(value: true, onChanged: (valor) {}),
                  Checkbox(value: false, onChanged: (valor) {}),
                  Checkbox(value: false, onChanged: (valor) {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("serie1"),
                  SizedBox(
                    width: 8,
                  ),
                  Text("serie2"),
                  SizedBox(
                    width: 8,
                  ),
                  Text("serie3"),
                  SizedBox(
                    width: 8,
                  ),
                  Text("serie4"),
                ],
              ),
              FirebaseAnimatedList(
                  shrinkWrap: true,
                  query: databaseReference,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation animation, int index) {
                    String datos = snapshot.value["Ejercicio1"].toString();
                    return DataTable(
                      headingRowHeight: 30,
                      dataRowHeight: 40,
                      columnSpacing: 20,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            '-------',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '1th',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '2th',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '3th  ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '4th  ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Kilos')),
                            DataCell(Text('5')),
                            DataCell(Text('5')),
                            DataCell(Text('10')),
                            DataCell(Text('15')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Repes')),
                            DataCell(Text('35')),
                            DataCell(Text('30')),
                            DataCell(Text('26')),
                            DataCell(Text('40')),
                          ],
                        ),
                      ],
                    );
                    // Text(snapshot.value["Ejercicio1"].toString());
                  }),
                  Text(_ejercicios),
                   DataTable(
                      headingRowHeight: 30,
                      dataRowHeight: 40,
                      columnSpacing: 20,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            '-------',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '1th',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '2th',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '3th  ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '4th  ',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Kilos')),
                            DataCell(Text('5')),
                            DataCell(Text('5')),
                            DataCell(Text('10')),
                            DataCell(Text('15')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Repes')),
                            DataCell(Text('35')),
                            DataCell(Text('30')),
                            DataCell(Text('26')),
                            DataCell(Text('40')),
                          ],
                        ),
                      ],
                    )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 211, 0, 50),
          onPressed: showData,
          child: Icon(
            Icons.check,
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
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: FlutterLogo(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Peso muerto"),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {}),
                IconButton(icon: Icon(Icons.graphic_eq), onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      final route = MaterialPageRoute(builder: (context) {
                        return Timer2(message: 25.0, message2: 5);
                      });
                      Navigator.push(context, route);
                    }),
              ],
            ),
            subtitle: Text("Femorales/pierna/gluteos/pantorrilas"),
          ),
        ],
      ),
    );
  }
}

class TableExercice extends StatefulWidget {
  TableExercice({Key? key}) : super(key: key);

  @override
  _TableExerciceState createState() => _TableExerciceState();
}

class _TableExerciceState extends State<TableExercice> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowHeight: 30,
      dataRowHeight: 40,
      columnSpacing: 20,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            '-------',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '1th',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '2th',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '3th  ',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            '4th  ',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Kilos')),
            DataCell(Text('5')),
            DataCell(Text('5')),
            DataCell(Text('10')),
            DataCell(Text('15')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Repes')),
            DataCell(Text('35')),
            DataCell(Text('30')),
            DataCell(Text('26')),
            DataCell(Text('40')),
          ],
        ),
      ],
    );
  }
}

class ExerciceInput extends StatefulWidget {
  ExerciceInput({Key? key}) : super(key: key);

  @override
  _ExerciceInputState createState() => _ExerciceInputState();
}

class _ExerciceInputState extends State<ExerciceInput> {
  final repes_controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Repeticiones:"),
              SizedBox(
                width: 130,
              ),
              Text("Kilos:"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text("+1")),
              Container(
                width: 35,
                height: 50,
                child: TextFormField(
                  controller: repes_controler,
                  keyboardType: TextInputType.number,
                ),
              ),
              TextButton(onPressed: () {}, child: Text("-1")),
              SizedBox(
                width: 20,
              ),
              TextButton(onPressed: () {}, child: Text("+5")),
              Container(
                width: 35,
                height: 50,
                child: TextFormField(
                  controller: repes_controler,
                  keyboardType: TextInputType.number,
                ),
              ),
              TextButton(onPressed: () {}, child: Text("-5")),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              TableExercice(),
              SizedBox(
                width: 40,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.check,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ExerciseJump extends StatelessWidget {
  const ExerciseJump({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: FlutterLogo(),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Peso muerto"),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () {}),
              ],
            ),
            subtitle: Text("Femorales/pierna/gluteos/pantorrilas"),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.exercice,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  Widget exercice;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Ejercicio $index',
      expandedValue: 'Este ejercicio $index consiste en ',
      exercice: ExerciseJump(),
    );
  });
}

class JumpExercice extends StatefulWidget {
  const JumpExercice({Key? key}) : super(key: key);

  @override
  State<JumpExercice> createState() => _JumpExerciceState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _JumpExerciceState extends State<JumpExercice> {
  final List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return item.exercice;
          },
          body: ExerciceInput(),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
