import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/location_entity.dart';
import 'package:rick_morty_app/presentation/providers/locations_repository_provider.dart';

const lastaPage = 7;

final locationsRickMortyProvider =
    StateNotifierProvider<LocationsNotifier, List<LocationEntity>>((ref) {
  final fetchLocations = ref.watch(locationsRepositoryProvider).getLocations;
  return LocationsNotifier(fetchLocations: fetchLocations);
});

typedef LocationsCallback = Future<List<LocationEntity>> Function({int page});

class LocationsNotifier extends StateNotifier<List<LocationEntity>> {
  int currentPage = 0;
  final LocationsCallback fetchLocations;

  LocationsNotifier({required this.fetchLocations}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    if (currentPage <= lastaPage) {
      final List<LocationEntity> locations =
          await fetchLocations(page: currentPage);
      state = [...state, ...locations];
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}
