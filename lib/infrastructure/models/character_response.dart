class CharacterResponse {
    final int id;
    final String name;
    final String status;
    final String species;
    final String type;
    final String gender;
    final CharacterLocationResponse origin;
    final CharacterLocationResponse location;
    final String image;
    final List<String> episode;
    final String url;
    final DateTime created;

    CharacterResponse({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        id: json["id"],
        name: json["name"],
        status: json["status"]!,
        species: json["species"]!,
        type: json["type"],
        gender: json["gender"]!,
        origin: CharacterLocationResponse.fromJson(json["origin"]),
        location: CharacterLocationResponse.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
    };
}

class CharacterLocationResponse {
    final String name;
    final String url;

    CharacterLocationResponse({
        required this.name,
        required this.url,
    });

    factory CharacterLocationResponse.fromJson(Map<String, dynamic> json) => CharacterLocationResponse(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}