import 'package:dartz/dartz.dart';
import 'package:pokebox/app/core/validations/validations.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

import '../repositories/pokemon_repository.dart';

abstract class GetPokemonSpecs {
  Future<Either<Failure, Specs>> call(String url);
}

class GetPokemonSpecsImpl implements GetPokemonSpecs {
  final PokemonRepository repository;

  GetPokemonSpecsImpl(this.repository);

  @override
  Future<Either<Failure, Specs>> call(String url) async {
    if (Validations().invalidUri(url)) {
      return Left(InvalidUri());
    } else {
      return await repository.getSpecsPokemon(url);
    }
  }
}
