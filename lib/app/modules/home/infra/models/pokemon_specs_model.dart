import 'dart:convert';

import 'package:pokebox/app/modules/home/domain/entities/specs.dart';

class PokemonSpecs extends Specs {
  PokemonSpecs(
      {required String name,
      required String photo,
      required int height,
      required int weight})
      : super(name: name, photo: photo, height: height, weight: weight);
  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'photo': photo,
      'name': name,
      'weight': weight,
    };
  }

  factory PokemonSpecs.fromMap(Map<String, dynamic> map) {
    return PokemonSpecs(
      height: map['height']?.toInt() ?? 0,
      photo: map['sprites']['front_default'] ?? '',
      name: map['name'] ?? '',
      weight: map['weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpecs.fromJson(String source) =>
      PokemonSpecs.fromMap(json.decode(source));
}
