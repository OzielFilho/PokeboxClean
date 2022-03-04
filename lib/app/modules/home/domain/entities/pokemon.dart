import 'package:pokebox/app/modules/home/domain/entities/specs.dart';

class Pokemon {
  final String name;
  final String url;
  final Specs specs;
  Pokemon({
    required this.specs,
    required this.name,
    required this.url,
  });
}
