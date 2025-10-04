import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Divison extends StatefulWidget{
  const Divison({super.key});

  @override
  State<StatefulWidget> createState() {
    return body();
  }
}

class body extends State<Divison>{
  final n1 = TextEditingController();
  final n2 = TextEditingController();

void dividir() {
    // Validamos que los campos no estén vacíos
    if (n1.text.isEmpty || n2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa ambos números')),
      );
      return;
    }
    double num1 = double.parse(n1.text);
    double num2 = double.parse(n2.text);

    double resultado = num1 / num2;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Resultado'),
        content: Text('La suma es: $resultado'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(
        child: Padding(padding: EdgeInsetsGeometry.all(15),
        child: Card(
          elevation: 18,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5)
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity, 
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: n1,
                       keyboardType: TextInputType.number, // Teclado numérico
                       inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      decoration:InputDecoration(
                        labelText: 'Escribe un numero',
                        border: OutlineInputBorder()
                      ),
                    ),   
                  ),
                  SizedBox(
                    height:8 ,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: n2,
                      keyboardType: TextInputType.number, // Teclado numérico
                       inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                      decoration:InputDecoration(
                        labelText: 'Escribe otro numero',
                        border: OutlineInputBorder()
                      ),
                    ),   
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed:dividir,
                     child: Text('Dividir')),
                  )
                ],
              ),
            ),
          ),
        ),
        ),
    ),
   );
  }

}