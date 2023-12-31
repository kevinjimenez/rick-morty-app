import 'package:rick_morty_app/infrastructure/models/character/character_response.dart';
import 'package:rick_morty_app/infrastructure/models/character/info_response.dart';

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