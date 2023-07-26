import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/domian/entities/episode_entity.dart';
import 'package:rick_morty_app/domian/entities/location_entity.dart';

abstract class RickMortyDatasource {
  Future<List<CharacterEntity>> getCharacters({int page = 1});
  Future<CharacterEntity> getCharacterById(String characterId);

  // location
  Future<List<LocationEntity>> getLocations({int page = 1});

  // episode
  Future<List<EpisodeEntity>> getEpisodes({int page = 1});
  Future<EpisodeEntity> getEpisodeById(String episodeId);
}
