import 'dart:convert';
import 'package:dio/dio.dart';

class GetPetition {
  final _dio = Dio();

  Future<List<dynamic>> getProducto() async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka');
    return response.data['drinks'];
  }

  Future<List<dynamic>> getRandomCocktails() async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/random.php');
    return response.data['drinks'];
  }

  Future<Map<String, dynamic>> getCoctelDetails(String id) async {
    final response = await _dio
        .get('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');
    return response.data['drinks'][0];
  }

  Future<List<dynamic>> getCoctelesPorIngrediente(String ingrediente) async {
    final response = await _dio.get(
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$ingrediente');
    return response.data['drinks'];
  }
}
