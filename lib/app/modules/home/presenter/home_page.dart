import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokebox/app/modules/home/presenter/home_controller.dart';
import 'package:pokebox/app/modules/home/presenter/widgets/listPokemon/list_pokemon_widget.dart';

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
        body: SingleChildScrollView(
          controller: controller.controllerScroll,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Pokemon List',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Divider(
                  color: Theme.of(context).primaryColor,
                ),
                controller.pokemons.isNotEmpty
                    ? ListPokemonWidget(
                        controllerScroll: controller.controllerScroll!,
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).hintColor),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
