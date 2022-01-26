import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pokebox/app/modules/home/domain/usecases/get_specs.dart';
import 'package:pokebox/app/modules/home/domain/usecases/search_by_len.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SearchByLen searchByLen;
  final GetSpecs getSpecs;

  _HomeControllerBase(this.searchByLen, this.getSpecs) {
    getData(100);
  }

  @observable
  List<PokemonModel> pokemons = [];

  @observable
  ScrollController? controllerScroll = ScrollController();

  @observable
  PokemonSpecs? pokemonActual;

  @action
  Future<void> getData(int len) async {
    var result = await searchByLen(len);
    return result.fold(
      (failure) => failure,
      (data) => pokemons = data as List<PokemonModel>,
    );
  }

  @action
  Future<void> getSpecsPokemon(String url) async {
    var result = await getSpecs(url);
    return result.fold(
      (failure) => failure,
      (data) => pokemonActual = data as PokemonSpecs?,
    );
  }
}
