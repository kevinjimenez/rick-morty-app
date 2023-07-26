import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/domian/entities/default_entity.dart';
import 'package:rick_morty_app/infrastructure/models/character/character_response.dart';

class CharacterMapper {
  static CharacterEntity characterResponsetoEntity(
          CharacterResponse character) =>
      CharacterEntity(
          id: character.id,
          name: character.name,
          image: character.image,
          url: character.url,
          location: DefaultEntity(
              name: character.location.name, url: character.location.url),
          origin: DefaultEntity(
              name: character.location.name, url: character.location.url),
          type: character.type,
          status: character.status,
          species: character.species,
          gender: character.gender,
          episode: character.episode,
          created: character.created);
}
