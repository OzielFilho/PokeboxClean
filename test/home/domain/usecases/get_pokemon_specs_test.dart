import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokebox/app/modules/home/domain/usecases/get_pokemon_specs.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository {}

main() {
  PokemonRepository? repository;
  GetPokemonSpecsImpl? usecase;
  Specs? resultSearch;

  setUp(() {
    repository = PokemonRepositoryMock();
    usecase = GetPokemonSpecsImpl(repository!);
    resultSearch = Specs(
        height: 0,
        name: faker.internet.userName(),
        photo: faker.image.image(),
        weight: 0);
  });

  test('Deve retornar uma especificacao', () async {
    when(() => repository!.getSpecsPokemon(any()))
        .thenAnswer((_) async => Right(resultSearch!));
    var result = await usecase!(faker.internet.uri('http'));
    expect(result.fold((l) => null, (r) => r), isA<Specs>());
  });

  test('Deve retornar uma Failure de InvalidUri ', () async {
    when(() => repository!.getSpecsPokemon(any()))
        .thenThrow((_) async => Left(InvalidUri()));

    var result = await usecase!('');

    expect(result.fold((l) => l, (r) => null), isA<InvalidUri>());
  });
}
