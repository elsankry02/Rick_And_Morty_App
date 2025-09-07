import 'package:dio/dio.dart';
import 'package:rick_and_morty/featrues/data/models/character_model.dart';

class CharacterService {
  final Dio dio;

  CharacterService({required this.dio});

  Future<List<Results>> characterFunc() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final data = response.data as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>;
    final List<Results> allCharcter = [];
    for (var allresults in results) {
      allCharcter.add(Results.fromJson(allresults));
    }
    return allCharcter;
  }
}
