import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/repositories/get_specs_repository.dart';
import 'package:pokebox/app/modules/home/infra/datasources/pokemon_specs_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';

class PokemonSpecsRepositoryImpl implements GetSpecsRepository {
  final PokemonSpecsDatasource datasource;

  PokemonSpecsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Specs>> getSpecs(String url) async {
    PokemonSpecs pokemonSpecs;
    try {
      pokemonSpecs = await datasource.getPokemonSpecs(url);
    } catch (e) {
      return Left(GetSpecsError());
    }
    return Right(pokemonSpecs);
  }
}
