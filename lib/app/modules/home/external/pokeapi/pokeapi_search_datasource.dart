import 'package:dio/dio.dart';
import 'package:pokebox/app/modules/home/infra/datasources/search_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';

class PokeapiSearchDatasource implements SearchDatasource {
  final Dio dio;

  PokeapiSearchDatasource(this.dio);

  @override
  Future<List<PokemonModel>> getPokemon(int len) async {
    var result =
        await dio.get('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=$len');
    if (result.statusCode == 200) {
      var listJson = result.data['results'] as List;

      return listJson.map((pokemon) {
        return PokemonModel(pokemon['name'], pokemon['url']);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
