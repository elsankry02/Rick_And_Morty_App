import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/models/results_model.dart';

class RickAndMortyServices {
  final Dio dio;

  RickAndMortyServices({required this.dio});

  Future<List<Results>> rickAndMortyFunc() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final data = response.data as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>;
    final List<Results> allCharcter = [];
    for (var allresults in results) {
      allCharcter.add(
        Results.fromJson(allresults),
      );
    }
    return allCharcter;
  }
}
