import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/presentation/providers/character_repository_provider.dart';

final characterRickMortyProvider =
    StateNotifierProvider<CharacterNotifier, Map<String, CharacterEntity>>((ref) {
  final fetchCharacter = ref.watch(characterRepositoryProvider).getCharacterById;
  return CharacterNotifier(fetchCharacter: fetchCharacter);
});

typedef CharacterCallback = Future<CharacterEntity> Function(
    String characterId);

class CharacterNotifier extends StateNotifier<Map<String, CharacterEntity>> {
  final CharacterCallback fetchCharacter;

  CharacterNotifier({required this.fetchCharacter}) : super({});

  Future<void> loadCharacterById(String characterId) async {
    if (state[characterId] != null) return;
    final CharacterEntity character = await fetchCharacter(characterId);
    state = {...state, characterId: character};
  }
}
