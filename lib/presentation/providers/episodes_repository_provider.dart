import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/infrastructure/datasources/rick_morty_db_datasource.dart';
import 'package:rick_morty_app/infrastructure/repositories/rick_morty_repository_impl.dart';

final episodesRepositoryProvider = Provider((ref) {
  return RickMortyRepositoryImpl(RickMortyDbDatasource());
});