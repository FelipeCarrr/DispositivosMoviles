import 'package:flutter/material.dart';
import 'package:parcial_uno/Screens/aboutScreen.dart';
import 'package:parcial_uno/Screens/coctelScreen.dart';
import 'package:parcial_uno/Screens/ingredienteScreen.dart';
import 'package:parcial_uno/Screens/recetaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indicador = 2;
  static final List<Map<String, dynamic>> _menu = [
    {'title': 'Ingredientes', 'widget': IngredienteScreen()},
    {'title': 'Receta', 'widget': const RecetaScreen()},
    {'title': 'Coctel', 'widget': const CoctelScreen()},
    {'title': 'About', 'widget': const AboutScreen()}
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    void changeItem(int index) {
      setState(() {
        _indicador = index;
      });
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: color.primary,
        title: Text(_menu[_indicador]["title"]),
      ),
      body: Center(
        child: _menu[_indicador]["widget"],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            ListTile(
              title: const Text('Ingrediente'),
              selected: _indicador == 0,
              onTap: () {
                changeItem(0);
              },
            ),
            ListTile(
              title: const Text("Receta de cocina"),
              selected: _indicador == 1,
              onTap: () {
                changeItem(1);
              },
            ),
            ListTile(
              title: const Text('Coctel'),
              selected: _indicador == 2,
              onTap: () {
                changeItem(2);
              },
            ),
            ListTile(
              title: const Text('About'),
              selected: _indicador == 3,
              onTap: () {
                changeItem(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
