import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/episode_entity.dart';
import 'package:rick_morty_app/presentation/providers/episodes_repository_provider.dart';

const lastaPage = 3;


// all
final episodesRickMortyProvider =
    StateNotifierProvider<EpisodesNotifier, List<EpisodeEntity>>((ref) {
  final fetchEpisodes = ref.watch(episodesRepositoryProvider).getEpisodes;
  return EpisodesNotifier(fetchEpisodes: fetchEpisodes);
});

typedef EpisodesCallback = Future<List<EpisodeEntity>> Function({int page});

class EpisodesNotifier extends StateNotifier<List<EpisodeEntity>> {
  int currentPage = 0;
  final EpisodesCallback fetchEpisodes;

  EpisodesNotifier({required this.fetchEpisodes}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    if (currentPage <= lastaPage) {
      final List<EpisodeEntity> locations =
          await fetchEpisodes(page: currentPage);
      state = [...state, ...locations];
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}


// By id
final episodeRickMortyProvider =
    StateNotifierProvider<EpisodeNotifier, Map<String, EpisodeEntity>>((ref) {
  final fetchEpisodeById = ref.watch(episodesRepositoryProvider).getEpisodeById;
  return EpisodeNotifier(fetchEpisodeById: fetchEpisodeById);
});

typedef EpisodeByIdCallback = Future<EpisodeEntity> Function(String episodeId);

class EpisodeNotifier extends StateNotifier<Map<String, EpisodeEntity>> {
  int currentPage = 0;
  final EpisodeByIdCallback fetchEpisodeById;

  EpisodeNotifier({required this.fetchEpisodeById}) : super({});

  Future<void> loadById(String episodeId) async {
    if (state[episodeId] != null) return;
    final EpisodeEntity episode = await fetchEpisodeById(episodeId);
    state = {...state, episodeId: episode};
  }
}
