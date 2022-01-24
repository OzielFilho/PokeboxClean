import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/entities/result.dart';
import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/repositories/search_repository.dart';
import 'package:pokebox/app/modules/home/infra/datasources/search_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Result>>> getData(int len) async {
    List<PokemonModel> list;
    try {
      list = await datasource.getPokemon(len);
    } catch (e) {
      return Left(SearchError());
    }

    return list.isNotEmpty ? Right(list) : Left(ResultEmpty());
  }
}
