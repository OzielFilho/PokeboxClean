import 'dart:convert';

import 'package:pokebox/app/modules/home/domain/entities/specs.dart';

class PokemonSpecs extends Specs {
  final int height;
  final String photo;
  final String name;
  final int weight;

  PokemonSpecs(this.height, this.photo, this.name, this.weight)
      : super(height: height, name: name, photo: photo, weight: weight);

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
      map['height']?.toInt() ?? 0,
      map['photo'] ?? '',
      map['name'] ?? '',
      map['weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpecs.fromJson(String source) =>
      PokemonSpecs.fromMap(json.decode(source));
}
