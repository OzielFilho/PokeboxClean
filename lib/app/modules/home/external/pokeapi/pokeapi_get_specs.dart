import 'package:pokebox/app/core/httpClient/dioclient_impl.dart';
import 'package:pokebox/app/modules/home/infra/datasources/pokemon_specs_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

class PokemonApiDatasource implements PokemonSpecsDatasource {
  final DioClientImplementation dio;

  PokemonApiDatasource(this.dio);

  @override
  Future<PokemonSpecs> getPokemonSpecs(String url) async {
    var result = await dio.getRequest(url);
    if (result.statusCode == 200) {
      return PokemonSpecs.fromMap(result.data);
    } else {
      throw Exception();
    }
  }
}
