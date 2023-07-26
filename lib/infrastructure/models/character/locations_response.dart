import 'package:rick_morty_app/infrastructure/models/character/info_response.dart';
import 'package:rick_morty_app/infrastructure/models/character/location_response.dart';

class LocationsResponse {
  final InfoResponse info;
  final List<LocationResponse> results;

  LocationsResponse({
    required this.info,
    required this.results,
  });

  factory LocationsResponse.fromJson(Map<String, dynamic> json) =>
      LocationsResponse(
        info: InfoResponse.fromJson(json["info"]),
        results: List<LocationResponse>.from(
            json["results"].map((x) => LocationResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
