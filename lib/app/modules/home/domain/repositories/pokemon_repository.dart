import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/entities/pokemon.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getListPokemon(int len);
  Future<Either<Failure, Specs>> getSpecsPokemon(String url);
}
