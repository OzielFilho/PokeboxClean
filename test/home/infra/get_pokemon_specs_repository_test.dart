import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/infra/datasources/pokemon_specs_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';
import 'package:pokebox/app/modules/home/infra/repositories/pokemon_specs_repository.dart';

class PokemonSpecsDataSourceMock extends Mock
    implements PokemonSpecsDatasource {}

main() {
  PokemonSpecsDatasource? dataSource;
  PokemonSpecsRepositoryImpl? repository;
  PokemonSpecs? pokemonModel;
  setUp(() {
    dataSource = PokemonSpecsDataSourceMock();
    repository = PokemonSpecsRepositoryImpl(dataSource!);
    pokemonModel =
        PokemonSpecs(0, faker.internet.userName(), faker.image.image(), 0);
  });

  test('Deve retorna um lista com os pokemons', () async {
    when(() => dataSource!.getPokemonSpecs(any()))
        .thenAnswer((_) async => pokemonModel!);

    final response = await repository!.getSpecs(faker.internet.uri('http'));

    expect(response.fold((l) => null, (r) => r), isA<PokemonSpecs>());
  });

  test('Deve retorna uma Failure GetSpecsError', () async {
    when(() => dataSource!.getPokemonSpecs(any()))
        .thenThrow((_) async => GetSpecsError());

    final response = await repository!.getSpecs(faker.internet.uri('http'));

    expect(response.fold((l) => l, (r) => null), isA<GetSpecsError>());
  });
}
