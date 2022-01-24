import 'package:dartz/dartz.dart';

import 'package:pokebox/app/modules/home/domain/entities/result.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/search_repository.dart';

abstract class SearchByLen {
  Future<Either<Failure, List<Result>>> call(int len);
}

class SearchByLenImpl implements SearchByLen {
  final SearchRepository repository;
  SearchByLenImpl(
    this.repository,
  );

  @override
  Future<Either<Failure, List<Result>>> call(int len) async {
    if (len < 0) {
      return Left(InvalidLen());
    } else {
      var result = await repository.getData(len);
      return result.fold(
          (l) => left(l), (r) => r.isEmpty ? left(ResultEmpty()) : right(r));
    }
    
  }
}
