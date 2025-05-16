import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/providers/provider.dart';

final rickAndMortyProvider = FutureProvider<List<Results>>((ref) async {
  final service = ref.read(resultsServiceProvider);
  return await service.characterFunc();
});
