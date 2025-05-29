import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/services/character_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final resultsServiceProvider = Provider<CharacterService>((ref) {
  final dio = ref.read(dioProvider);
  return CharacterService(dio: dio);
});
