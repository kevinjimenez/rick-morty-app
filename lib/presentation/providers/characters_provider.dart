import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/presentation/providers/characters_repository_provider.dart';

const lastaPage = 42;

final characterRickMortyProvider =
    StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchCharacters = ref.watch(charactersRepositoryProvider).getCharacters;
  return CharactersNotifier(fetchCharacters: fetchCharacters);
});

typedef CharactersCallback = Future<List<CharacterEntity>> Function({int page});

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  int currentPage = 0;
  final CharactersCallback fetchCharacters;

  CharactersNotifier({required this.fetchCharacters}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    if (currentPage <= lastaPage) {
      final List<CharacterEntity> characters =
          await fetchCharacters(page: currentPage);
      state = [...state, ...characters];
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}
