import 'package:rick_morty_app/domian/entities/episode_entity.dart';
import 'package:rick_morty_app/infrastructure/models/character/episode_reponse.dart';

class EpisodeMapper {
  static EpisodeEntity episodeResponsetoEntity(EpisodeResponse episode) =>
      EpisodeEntity(
          id: episode.id,
          airDate: episode.airDate,
          characters: episode.characters,
          created: episode.created,
          episode: episode.episode,
          name: episode.name,
          url: episode.url);
}
