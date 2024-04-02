import 'package:flutter/material.dart';

class ListaWidget extends StatelessWidget {
  final String id;

  const ListaWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingrediente"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(id),
            const Text('dos'),
          ],
        ),
      ),
    );
  }
}
