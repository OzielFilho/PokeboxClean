import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';

abstract class SearchDatasource {
  Future<List<PokemonModel>> getPokemon(int len);
}
