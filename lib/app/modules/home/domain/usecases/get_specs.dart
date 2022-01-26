import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/get_specs_repository.dart';

abstract class GetSpecs {
  Future<Either<Failure, Specs>> call(String url);
}

class GetSpecsImpl implements GetSpecs {
  final GetSpecsRepository repository;

  GetSpecsImpl(this.repository);

  @override
  Future<Either<Failure, Specs>> call(String url) async {
    if (url.isEmpty || url == '') {
      return Left(InvalidUri());
    } else {
      var result = await repository.getSpecs(url);
      return result.fold((l) => left(l), (r) => right(r));
    }
  }
}
