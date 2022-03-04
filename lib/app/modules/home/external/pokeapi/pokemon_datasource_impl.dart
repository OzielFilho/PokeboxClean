import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';

import '../../../../core/httpClient/dioclient_impl.dart';
import '../../infra/datasources/pokemon_datasource.dart';

class PokemonApiDatasource implements PokemonDatasource {
  final DioClientImplementation dio;

  PokemonApiDatasource(this.dio);

  @override
  Future<List<PokemonModel>> getListPokemon(int len) async {
    var result = await dio
        .getRequest('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$len');
    if (result.statusCode == 200) {
      List<PokemonModel> pokemonsList = [];
      var listJson = result.data['results'] as List;

      var pokemons = listJson.map((pokemon) async {
        PokemonSpecs specs = await getSpecsPokemon(pokemon['url']);
        return PokemonModel.fromMap(pokemon, specs);
      }).toList();

      for (var element in pokemons) {
        await element.then((value) => pokemonsList.add(value));
      }
      return pokemonsList;
    } else {
      throw Exception();
    }
  }

  @override
  Future<PokemonSpecs> getSpecsPokemon(String url) async {
    var result = await dio.getRequest(url);
    if (result.statusCode == 200) {
      return PokemonSpecs.fromMap(result.data);
    } else {
      throw Exception();
    }
  }
}
