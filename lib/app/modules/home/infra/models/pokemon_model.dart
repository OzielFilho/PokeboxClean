import 'dart:convert';

import 'package:pokebox/app/modules/home/domain/entities/result.dart';

class PokemonModel extends Result {
  final String name;
  final int height;
  final int weight;

  PokemonModel(this.name, this.height, this.weight);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'height': height,
      'weight': weight,
    };
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      map['name'] ?? '',
      map['height']?.toInt() ?? 0,
      map['weight']?.toInt() ?? 0,
    );
  }
}
