import 'package:rick_morty_app/infrastructure/models/character/character_response.dart';

class CharactersResponse {
    final InfoResponse info;
    final List<CharacterResponse> results;

    CharactersResponse({
        required this.info,
        required this.results,
    });

    factory CharactersResponse.fromJson(Map<String, dynamic> json) => CharactersResponse(
        info: InfoResponse.fromJson(json["info"]),
        results: List<CharacterResponse>.from(json["results"].map((x) => CharacterResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class InfoResponse {
    final int count;
    final int pages;
    final String? next;
    final String? prev;

    InfoResponse({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    factory InfoResponse.fromJson(Map<String, dynamic> json) => InfoResponse(
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
