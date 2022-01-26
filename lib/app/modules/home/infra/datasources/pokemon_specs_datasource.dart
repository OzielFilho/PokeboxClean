import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

abstract class PokemonSpecsDatasource {
  Future<PokemonSpecs> getPokemonSpecs(String url);
}
