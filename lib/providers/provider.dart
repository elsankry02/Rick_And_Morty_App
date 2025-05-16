import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/services/character_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final resultsServiceProvider = Provider<CharacterService>((ref) {
  return CharacterService(dio: ref.read(dioProvider));
});
