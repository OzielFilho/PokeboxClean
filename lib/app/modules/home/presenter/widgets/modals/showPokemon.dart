// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

showPokemon({BuildContext? context, PokemonSpecs? pokemonActual}) {
  return showModalBottomSheet(
    context: context!,
    isDismissible: true,
    enableDrag: false,
    isScrollControlled: false,
    backgroundColor: Theme.of(context).backgroundColor,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage(
              pokemonActual!.photo,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            pokemonActual.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Weight: ${pokemonActual.weight} kg',
            style: Theme.of(context).textTheme.button,
          ),
          Text(
            'Height: ${pokemonActual.height} m',
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
    ),
  );
}
