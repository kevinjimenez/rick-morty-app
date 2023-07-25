import 'package:rick_morty_app/domian/entities/character_entity.dart';

abstract class RickMortyRepository {
  Future<List<CharacterEntity>> getCharacters();
}
