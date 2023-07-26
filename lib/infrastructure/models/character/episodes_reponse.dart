import 'package:rick_morty_app/infrastructure/models/character/episode_reponse.dart';
import 'package:rick_morty_app/infrastructure/models/character/info_response.dart';

class EpisodesResponse {
    final InfoResponse info;
    final List<EpisodeResponse> results;

    EpisodesResponse({
        required this.info,
        required this.results,
    });

    factory EpisodesResponse.fromJson(Map<String, dynamic> json) => EpisodesResponse(
        info: InfoResponse.fromJson(json["info"]),
        results: List<EpisodeResponse>.from(json["results"].map((x) => EpisodeResponse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}