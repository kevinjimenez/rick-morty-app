import 'package:rick_morty_app/domian/datasources/rick_morty_datasource.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/domian/entities/episode_entity.dart';
import 'package:rick_morty_app/domian/entities/location_entity.dart';
import 'package:rick_morty_app/domian/repositories/rick_morty_repository.dart';

class RickMortyRepositoryImpl extends RickMortyRepository {
  final RickMortyDatasource datasource;

  RickMortyRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) {
    return datasource.getCharacters(page: page);
  }
  
  @override
  Future<CharacterEntity> getCharacterById(String characterId) {
    return datasource.getCharacterById(characterId);
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) {
    return datasource.getLocations(page: page);
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes({int page = 1}) {
    return datasource.getEpisodes(page: page);
  }
  
  @override
  Future<EpisodeEntity> getEpisodeById(String episodeId) {
    return datasource.getEpisodeById(episodeId);
  }
}
