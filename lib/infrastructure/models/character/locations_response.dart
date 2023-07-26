import 'package:rick_morty_app/infrastructure/models/character/location_response.dart';

class LocationsResponse {
    final LocationsInfoResponse info;
    final List<LocationResponse> results;

    LocationsResponse({
        required this.info,
        required this.results,
    });

    factory LocationsResponse.fromJson(Map<String, dynamic> json) => LocationsResponse(
        info: LocationsInfoResponse.fromJson(json["info"]),
        results: List<LocationResponse>.from(json["results"].map((x) => LocationResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class LocationsInfoResponse {
    final int count;
    final int pages;
    final String? next;
    final String? prev;

    LocationsInfoResponse({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    factory LocationsInfoResponse.fromJson(Map<String, dynamic> json) => LocationsInfoResponse(
        count: json["count"],
        pages: json["pages"],
        next: json["next"] ?? '',
        prev: json["prev"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}