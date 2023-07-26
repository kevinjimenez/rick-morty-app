class LocationEntity {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
