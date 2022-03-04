import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

import 'package:pokebox/app/modules/home/domain/entities/specs.dart';

import 'package:pokebox/app/modules/home/domain/entities/pokemon.dart';

import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/infra/datasources/pokemon_datasource.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_specs_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Pokemon>>> getListPokemon(int len) async {
    List<PokemonModel> list;
    try {
      list = await datasource.getListPokemon(len);
    } catch (e) {
      return Left(SearchError());
    }

    return list.isNotEmpty ? Right(list) : Left(ResultEmpty());
  }

  @override
  Future<Either<Failure, Specs>> getSpecsPokemon(String url) async {
    PokemonSpecs pokemonSpecs;
    try {
      pokemonSpecs = await datasource.getSpecsPokemon(url);
    } catch (e) {
      return Left(GetSpecsError());
    }
    return Right(pokemonSpecs);
  }
}
