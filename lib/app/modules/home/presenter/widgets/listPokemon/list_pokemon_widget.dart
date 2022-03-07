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
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        controller: controllerScroll,
        shrinkWrap: true,
        itemCount: controllerHome.pokemons.length,
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (c, i) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      controllerHome.pokemons[i].name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                controllerHome.pokemons[i].specs.photo)),
                      ),
                    ),
                    Text(
                      'Weight: ${controllerHome.pokemons[i].specs.weight} kg',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      'Height: ${controllerHome.pokemons[i].specs.height / 10} m',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ));
  }
}
