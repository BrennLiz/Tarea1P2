
import 'package:flutter/material.dart';
import 'package:tarea1/widget/division.dart';
import 'package:tarea1/widget/multiplicacion.dart';
import 'package:tarea1/widget/resta.dart';
import 'package:tarea1/widget/suma.dart';


class Pagina extends StatefulWidget{
  const Pagina({super.key});
  @override
  State<StatefulWidget> createState() {
    return Disenio();
  }
}

class Disenio extends State<Pagina>{

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Navigator Bar',
        style: TextStyle(
          color: const Color.fromARGB(255, 33, 18, 5),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 142, 95, 54),//color de la parte superior
      ),
      // (_index == 1 ? Centro():Derecho()
      //body: _index == 0 ? Suma(): (_index == 1 ? Resta():Multiplicacion():Divison()),
      body: _index == 0
      ? Suma()
      : _index == 1
        ? Resta()
        : _index == 2
            ? Multiplicacion()
            : Divison(),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 165, 117, 77),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Suma',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Resta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_reaction_outlined),
            label: 'Multiplicación',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out),
            label: 'División',
          ),*/
        ],
        currentIndex: _index,
        selectedItemColor: const Color.fromARGB(255, 75, 49, 9),
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}