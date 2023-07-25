import 'package:rick_morty_app/domian/entities/character_entity.dart';

abstract class RickMortyDatasource {
  Future<List<CharacterEntity>> getCharacters({int page = 1});
  Future<CharacterEntity> getCharacter(String characterId);
}
