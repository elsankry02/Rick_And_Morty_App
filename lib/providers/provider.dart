import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/services/rick_and_morty_services.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final resultsServiceProvider = Provider<RickAndMortyServices>((ref) {
  return RickAndMortyServices(dio: ref.read(dioProvider));
});
