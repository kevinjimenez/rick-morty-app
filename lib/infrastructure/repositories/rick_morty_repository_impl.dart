import 'package:rick_morty_app/domian/datasources/rick_morty_datasource.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/domian/repositories/rick_morty_repository.dart';

class RickMortyRepositoryImpl extends RickMortyRepository{
  final RickMortyDatasource datasource;

  RickMortyRepositoryImpl(this.datasource);

  @override
  Future<List<CharacterEntity>> getCharacters() {
    return datasource.getCharacters();
  }
  
}