import '../models/pokemon_model.dart';
import '../models/pokemon_specs_model.dart';

abstract class PokemonDatasource {
  Future<List<PokemonModel>> getListPokemon(int len);
  Future<PokemonSpecs> getSpecsPokemon(String url);
}
