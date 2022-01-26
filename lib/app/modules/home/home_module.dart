import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/core/httpClient/dioclient_impl.dart';
import 'package:pokebox/app/modules/home/external/pokeapi/pokeapi_search_datasource.dart';
import 'package:pokebox/app/modules/home/infra/repositories/search_repository_impl.dart';
import 'package:pokebox/app/modules/home/presenter/home_page.dart';

import 'domain/usecases/get_specs.dart';
import 'domain/usecases/search_by_len.dart';
import 'external/pokeapi/pokeapi_get_specs.dart';
import 'infra/repositories/pokemon_specs_repository.dart';
import 'presenter/home_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => DioClientImplementation(i<Dio>())),
        Bind((i) => PokeapiSearchDatasource(i<DioClientImplementation>())),
        Bind((i) => SearchRepositoryImpl(i<PokeapiSearchDatasource>())),
        Bind((i) => SearchByLenImpl(i<SearchRepositoryImpl>())),
        Bind((i) => PokemonApiDatasource(i<DioClientImplementation>())),
        Bind((i) => PokemonSpecsRepositoryImpl(i<PokemonApiDatasource>())),
        Bind((i) => GetSpecsImpl(i<PokemonSpecsRepositoryImpl>())),
        Bind((i) => HomeController(i<SearchByLenImpl>(), i<GetSpecsImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const HomePage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
      ];
}
