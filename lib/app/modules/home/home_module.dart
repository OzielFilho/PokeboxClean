import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/core/httpClient/dioclient_impl.dart';
import 'package:pokebox/app/modules/home/external/pokeapi/pokemon_datasource_impl.dart';
import 'package:pokebox/app/modules/home/infra/repositories/pokemon_repository_impl.dart';
import 'package:pokebox/app/modules/home/presenter/home_page.dart';

import 'domain/usecases/get_list_pokemon.dart';
import 'presenter/home_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => DioClientImplementation(i<Dio>())),
        Bind((i) => PokemonApiDatasource(i<DioClientImplementation>())),
        Bind((i) => PokemonRepositoryImpl(i<PokemonApiDatasource>())),
        Bind((i) => GetListPokemonImpl(i<PokemonRepositoryImpl>())),
        Bind((i) => HomeController(i<GetListPokemonImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const HomePage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
      ];
}
