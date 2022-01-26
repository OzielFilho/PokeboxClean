import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

abstract class GetSpecsRepository {
  Future<Either<Failure, Specs>> getSpecs();
}
