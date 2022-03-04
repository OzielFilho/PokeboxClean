import 'dart:convert';

import 'package:pokebox/app/modules/home/domain/entities/pokemon.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

class PokemonModel extends Pokemon {
  PokemonModel(
      {required Specs specs, required String name, required String url})
      : super(specs: specs, name: name, url: url);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map, PokemonSpecs specs) {
    return PokemonModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      specs: specs,
    );
  }

  String toJson() => json.encode(toMap());
}
