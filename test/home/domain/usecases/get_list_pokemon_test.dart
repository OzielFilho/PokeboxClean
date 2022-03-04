import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/entities/pokemon.dart';
import 'package:pokebox/app/modules/home/domain/entities/specs.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokebox/app/modules/home/domain/usecases/get_list_pokemon.dart';

class PokemonRepositoryMock extends Mock implements PokemonRepository {}

main() {
  PokemonRepository? repository;
  GetListPokemonImpl? usecase;
  Pokemon? resultSearch;

  setUp(() {
    repository = PokemonRepositoryMock();
    usecase = GetListPokemonImpl(repository!);
    resultSearch = Pokemon(
        name: faker.internet.userName(),
        url: faker.internet.uri('http'),
        specs: Specs(height: 1, name: '', photo: '', weight: 1));
  });

  test('Deve retornar uma lista com os result', () async {
    when(() => repository!.getListPokemon(any()))
        .thenAnswer((_) async => Right(<Pokemon>[resultSearch!]));
    var result = await usecase!(1);
    expect(result.fold((l) => null, (r) => r), isA<List<Pokemon>>());
  });

  test('Deve retornar uma Failure de InvalidLen', () async {
    when(() => repository!.getListPokemon(any()))
        .thenThrow((_) async => Left(InvalidLen()));

    final result = await usecase!(-1);

    expect(result.fold((l) => l, (r) => null), isA<InvalidLen>());
  });
}
