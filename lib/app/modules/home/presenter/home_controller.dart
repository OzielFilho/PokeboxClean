import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import '../domain/usecases/get_list_pokemon.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetListPokemon getListPokemon;

  _HomeControllerBase(
    this.getListPokemon,
  ) {
    getData(50);
  }

  @observable
  List<PokemonModel> pokemons = [];

  @observable
  ScrollController? controllerScroll = ScrollController();

  @action
  Future<void> getData(int len) async {
    var result = await getListPokemon(len);
    return result.fold(
      (failure) => failure,
      (data) => pokemons = data as List<PokemonModel>,
    );
  }
}
