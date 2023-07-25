class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  // final CharacterLocationResponse origin;
  // final CharacterLocationResponse location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
}
