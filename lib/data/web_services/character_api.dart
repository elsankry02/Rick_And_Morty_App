import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getApi() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    return response.data;
  }
}
