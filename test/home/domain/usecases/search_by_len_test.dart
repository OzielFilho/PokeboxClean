import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/entities/result.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/search_repository.dart';
import 'package:pokebox/app/modules/home/domain/usecases/search_by_len.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  SearchRepository? repository;
  SearchByLenImpl? usecase;
  Result? resultSearch;

  setUp(() {
    repository = SearchRepositoryMock();
    usecase = SearchByLenImpl(repository!);
    resultSearch =
        Result(height: 1, name: faker.internet.userName(), weight: 1);
  });

  test('Deve retornar uma lista com os pokemons', () async {
    when(() => repository!.getData(any()))
        .thenAnswer((_) async => Right(<Result>[resultSearch!]));
    var result = await usecase!(1);
    expect(result.fold((l) => null, (r) => r), isA<List<Result>>());
  });

  test('Deve retornar uma Failure de InvalidLen', () async {
    when(() => repository!.getData(any())).thenThrow((_) async => InvalidLen());

    final result = await usecase!(-1);

    expect(result.fold((l) => l, (r) => null), isA<InvalidLen>());
  });

  test('Deve retornar uma Failure de ResultEmpty', () async {
    when(() => repository!.getData(any()))
        .thenAnswer((_) async => const Right(<Result>[]));

    final result = await usecase!(1);

    expect(result.fold((l) => l, (r) => []), isA<ResultEmpty>());
  });
}
