import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/modules/home/presenter/home_controller.dart';

import 'widgets/modals/showPokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.pokemons.length,
              itemBuilder: (c, i) => ListTile(
                    title: Text('${i + 1}. ${controller.pokemons[i].name}'),
                    onTap: () async {
                      await controller
                          .getSpecsPokemon(controller.pokemons[i].url);
                      showPokemon(
                          context: context,
                          pokemonActual: controller.pokemonActual);
                    },
                  )),
        ),
      );
    });
  }
}
