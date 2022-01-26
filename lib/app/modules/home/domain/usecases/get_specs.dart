import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/get_specs_repository.dart';

abstract class GetSpecs {
  Future<Either<Failure, Specs>> call();
}

class GetSpecsImpl implements GetSpecs {
  final GetSpecsRepository repository;

  GetSpecsImpl(this.repository);

  @override
  Future<Either<Failure, Specs>> call() async {
    var result = await repository.getSpecs();

    return result.fold((l) => left(l), (r) => right(r));
  }
}
