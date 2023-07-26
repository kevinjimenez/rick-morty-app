import 'package:rick_morty_app/domian/datasources/rick_morty_datasource.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:dio/dio.dart';
import 'package:rick_morty_app/domian/entities/location_entity.dart';
import 'package:rick_morty_app/infrastructure/mappers/character_mapper.dart';
import 'package:rick_morty_app/infrastructure/mappers/location_mapper.dart';
import 'package:rick_morty_app/infrastructure/models/character/character_response.dart';
import 'package:rick_morty_app/infrastructure/models/character/characters_response.dart';
import 'package:rick_morty_app/infrastructure/models/character/locations_response.dart';

class RickMortyDbDatasource extends RickMortyDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api',
  ));

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) async {
    final response =
        await dio.get('/character', queryParameters: {'page': page});
    final charactersResponse = CharactersResponse.fromJson(response.data);
    final List<CharacterEntity> characters = charactersResponse.results
        .map(
            (character) => CharacterMapper.characterResponsetoEntity(character))
        .toList();
    return characters;
  }

  @override
  Future<CharacterEntity> getCharacter(String characterId) async {
    final response = await dio.get('/character/$characterId');
    final characterResponse = CharacterResponse.fromJson(response.data);
    final CharacterEntity character =
        CharacterMapper.characterResponsetoEntity(characterResponse);
    return character;
  }

  @override
  Future<List<LocationEntity>> getLocations({int page = 1}) async {
    final response =
        await dio.get('/location', queryParameters: {'page': page});
    final locationsResponse = LocationsResponse.fromJson(response.data);
    final List<LocationEntity> locations = locationsResponse.results
        .map((location) => LocationMapper.locationResponsetoEntity(location))
        .toList();
    return locations;
  }
}
