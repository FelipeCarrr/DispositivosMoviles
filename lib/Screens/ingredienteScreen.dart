import 'package:flutter/material.dart';
import 'package:parcial_uno/widget/lista_widget.dart';

class IngredienteScreen extends StatelessWidget {
  IngredienteScreen({super.key});

  final List<String> items = [
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListaWidget(
                              id: index.toString(),
                            )));
              },
              title: Text(items[index]),
            );
          }),
    );
  }
}
