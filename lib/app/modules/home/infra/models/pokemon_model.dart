import 'dart:convert';

import 'package:pokebox/app/modules/home/domain/entities/result.dart';

class PokemonModel extends Result {
  @override
  // ignore: overridden_fields
  final String name;
  @override
  // ignore: overridden_fields
  final String url;

  PokemonModel(this.name, this.url) : super(name: name, url: url);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      map['name'] ?? '',
      map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
