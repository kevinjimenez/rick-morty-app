import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/presentation/providers/characters_repository_provider.dart';

final characterRickMortyProvider =
    StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchCharacters = ref.watch(charactersRepositoryProvider).getCharacters;
  return CharactersNotifier(fetchCharacters: fetchCharacters);
});

typedef CharactersCallback = Future<List<CharacterEntity>> Function();

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  final CharactersCallback fetchCharacters;

  CharactersNotifier({required this.fetchCharacters}) : super([]);

  Future<void> loadNextPage() async {
    final List<CharacterEntity> characters = await fetchCharacters();
    state = [...state, ...characters];
  }
}
