import 'package:flutter/material.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

showPokemon({BuildContext? context, PokemonSpecs? pokemonActual}) {
  return showModalBottomSheet(
    context: context!,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage(
              pokemonActual!.photo,
            ),
          ),
          Text(
            pokemonActual.name,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Weight: ${pokemonActual.weight} kg'),
          Text('Height: ${pokemonActual.height} m'),
        ],
      ),
    ),
  );
}
