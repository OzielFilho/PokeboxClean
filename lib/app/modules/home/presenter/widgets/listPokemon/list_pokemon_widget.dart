import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/modules/home/presenter/home_controller.dart';

class ListPokemonWidget extends StatelessWidget {
  final ScrollController controllerScroll;

  const ListPokemonWidget({
    Key? key,
    required this.controllerScroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerHome = Modular.get<HomeController>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          controller: controllerScroll,
          shrinkWrap: true,
          itemCount: controllerHome.pokemons.length,
          itemBuilder: (c, i) => ListTile(
                title: Text(
                  '${i + 1}. ${controllerHome.pokemons[i].name.toUpperCase()}',
                  style: Theme.of(context).textTheme.button,
                ),
                onTap: () async {
                  // await controllerHome
                  //     .getSpecsPokemon(controllerHome.pokemons[i].url);
                  // showPokemon(
                  //     context: context,
                  //     pokemonActual: controllerHome.pokemonActual);
                },
              )),
    );
  }
}
