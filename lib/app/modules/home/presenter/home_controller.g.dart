// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokemonsAtom = Atom(name: '_HomeControllerBase.pokemons');

  @override
  List<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$controllerScrollAtom =
      Atom(name: '_HomeControllerBase.controllerScroll');

  @override
  ScrollController? get controllerScroll {
    _$controllerScrollAtom.reportRead();
    return super.controllerScroll;
  }

  @override
  set controllerScroll(ScrollController? value) {
    _$controllerScrollAtom.reportWrite(value, super.controllerScroll, () {
      super.controllerScroll = value;
    });
  }

  final _$pokemonActualAtom = Atom(name: '_HomeControllerBase.pokemonActual');

  @override
  PokemonSpecs? get pokemonActual {
    _$pokemonActualAtom.reportRead();
    return super.pokemonActual;
  }

  @override
  set pokemonActual(PokemonSpecs? value) {
    _$pokemonActualAtom.reportWrite(value, super.pokemonActual, () {
      super.pokemonActual = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_HomeControllerBase.getData');

  @override
  Future<void> getData(int len) {
    return _$getDataAsyncAction.run(() => super.getData(len));
  }

  final _$getSpecsPokemonAsyncAction =
      AsyncAction('_HomeControllerBase.getSpecsPokemon');

  @override
  Future<void> getSpecsPokemon(String url) {
    return _$getSpecsPokemonAsyncAction.run(() => super.getSpecsPokemon(url));
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
controllerScroll: ${controllerScroll},
pokemonActual: ${pokemonActual}
    ''';
  }
}
