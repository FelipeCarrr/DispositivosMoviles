import 'package:flutter/material.dart';
import 'package:parcial_uno/Screens/detalleCoctelScreen.dart';
import 'package:parcial_uno/config/helpers/get_petition.dart';

class CoctelScreen extends StatefulWidget {
  const CoctelScreen({super.key});

  @override
  CoctelScreenState createState() => CoctelScreenState();
}

class CoctelScreenState extends State<CoctelScreen> {
  final petition = GetPetition();
  late List<dynamic> cocteles = [];

  void cargarCoctelesPrincipales() async {
    var response = await petition.getProducto();
    setState(() {
      cocteles = response;
    });
  }

  void cargarCoctelesAleatorios() async {
    var response = await petition.getRandomCocktails();
    setState(() {
      cocteles = response;
    });
  }

  void cargarCoctelesPorTipo(String tipo) async {
    List<dynamic> response = [];
    if (tipo == 'Ginebra') {
      response = await petition.getCoctelesPorIngrediente('gin');
    } else if (tipo == 'Vodka') {
      response = await petition.getCoctelesPorIngrediente('vodka');
    }
    setState(() {
      cocteles = response;
    });
  }

  @override
  void initState() {
    super.initState();
    cargarCoctelesPrincipales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              cargarCoctelesPrincipales();
            },
          ),
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: () {
              cargarCoctelesAleatorios();
            },
          ),
          PopupMenuButton<String>(
            onSelected: cargarCoctelesPorTipo,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Ginebra',
                  child: Text('Cocteles de Ginebra'),
                ),
                const PopupMenuItem<String>(
                  value: 'Vodka',
                  child: Text('Cocteles de Vodka'),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cocteles.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesCoctelScreen(
                        coctel: cocteles[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            cocteles[index]["strDrinkThumb"],
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Container(
                                height: MediaQuery.of(context).size.width * 0.7,
                                child: const Text("cargando"),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(cocteles[index]["strDrink"].toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
