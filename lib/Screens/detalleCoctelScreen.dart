import 'package:flutter/material.dart';
import 'package:parcial_uno/config/helpers/get_petition.dart';

class DetallesCoctelScreen extends StatelessWidget {
  final dynamic coctel;
  final petition = GetPetition();

  DetallesCoctelScreen({super.key, required this.coctel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coctel['strDrink'])),
      body: FutureBuilder<Map<String, dynamic>>(
        future: petition.getCoctelDetails(coctel['idDrink']),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final coctelDetails = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.network(
                        coctelDetails['strDrinkThumb'],
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Instrucciones:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(coctelDetails['strInstructions']),
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredientes:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Construir la lista de ingredientes
                  for (int i = 1; i <= 15; i++)
                    if (coctelDetails['strIngredient$i'] != null &&
                        coctelDetails['strIngredient$i'].trim().isNotEmpty)
                      Text(
                          '${coctelDetails['strIngredient$i']} - ${coctelDetails['strMeasure$i'] ?? ""}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
