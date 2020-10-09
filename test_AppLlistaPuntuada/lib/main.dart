import 'package:flutter/material.dart';
import 'dart:async';

import 'dog_model.dart';
import 'dog_list.dart';
import 'new_dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WE RATE CARS',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'WE RATE CARS',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog(
        'Toyota Celica',
        'GROUP A (1990) - Japan',
        'Best car in the world. Also, my car.',
        'https://i.pinimg.com/originals/af/89/d0/af89d0c6b6ae0e98b746f3055755bd0c.jpg'))
    ..add(Dog(
        'Subaru Impreza',
        'GROUP A (1992) - Japan',
        'A well refined and reliable rally car',
        'https://i.pinimg.com/originals/a6/71/e6/a671e64c9c0084e608a3abc21aefadd5.jpg'))
    ..add(Dog(
        'Audi Quattro',
        'GROUP B (1981) - Germany',
        'One of the first four wheel drive cars',
        'https://periodismodelmotor.com/wp-content/uploads/2020/02/Audi-Quattro-S1-Evo-2-.jpg'))
    ..add(Dog(
        'Peugeot T16',
        'GROUP B (1984) - France',
        'A four wheel drive compact monster',
        'https://periodismodelmotor.com/wp-content/uploads/2020/04/Historia-dedos-humanos-motor-Peugeot-205-T16-Grupo-B-1280x720.jpg'))
    ..add(Dog('Lancia 037', 'GROUP B (1982) - Italy', 'The last true rear wheel drive rally car.', 'https://soymotor.com/sites/default/files/usuarios/redaccion/portal/jmvinuesa/lancia_037_305_1.jpg'));

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDogFormPage();
    }));
    if (newDog != null) {
      initialDoggos.add(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.indigo[800],
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                .1,
                .5,
                .7,
                .9
              ],
                  colors: [
                Colors.orange[800],
                Colors.orange[700],
                Colors.orange[600],
                Colors.orange[400]
              ])),
          child: new Center(
            child: new DogList(initialDoggos),
          )),
    );
  }
}
