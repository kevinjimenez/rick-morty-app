import 'package:rick_morty_app/domian/entities/location_entity.dart';
import 'package:rick_morty_app/infrastructure/models/character/location_response.dart';

class LocationMapper {
  static LocationEntity locationResponsetoEntity(LocationResponse location) =>
      LocationEntity(
          id: location.id,
          url: location.url,
          type: location.type,
          residents: location.residents,
          name: location.name,
          dimension: location.dimension,
          created: location.created);
}
