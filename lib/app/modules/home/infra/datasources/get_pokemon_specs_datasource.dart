import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

abstract class GetPokemonSpecsDatasource {
  Future<PokemonSpecs> getPokemonSpecs(String url);
}
