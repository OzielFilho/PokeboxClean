import 'package:dartz/dartz.dart';
import 'package:pokebox/app/core/validations/validations.dart';

import 'package:pokebox/app/modules/home/domain/entities/pokemon.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

import '../repositories/pokemon_repository.dart';

abstract class GetListPokemon {
  Future<Either<Failure, List<Pokemon>>> call(int len);
}

class GetListPokemonImpl implements GetListPokemon {
  final PokemonRepository repository;
  GetListPokemonImpl(
    this.repository,
  );

  @override
  Future<Either<Failure, List<Pokemon>>> call(int len) async {
    if (Validations().invalidLen(len)) {
      return Left(InvalidLen());
    }

    return await repository.getListPokemon(len);
  }
}
