import 'package:dio/dio.dart';
import 'package:pokebox/app/modules/home/infra/datasources/get_pokemon_specs_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

class GetPokemonApiDatasource implements GetPokemonSpecsDatasource {
  final Dio dio;

  GetPokemonApiDatasource(this.dio);

  @override
  Future<PokemonSpecs> getPokemonSpecs(String url) async {
    var result = await dio.get(url);
    if (result.statusCode == 200) {
      return PokemonSpecs.fromMap(result.data);
    } else {
      throw Exception();
    }
  }
}
