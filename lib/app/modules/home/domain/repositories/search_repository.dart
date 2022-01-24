import 'package:dartz/dartz.dart';
import 'package:pokebox/app/modules/home/domain/entities/result.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Result>>> getData(int len);
}
