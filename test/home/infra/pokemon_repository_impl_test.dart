import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/infra/datasources/pokemon_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_specs_model.dart';
import 'package:pokebox/app/modules/home/infra/repositories/pokemon_repository_impl.dart';

class PokemonDataSourceMock extends Mock implements PokemonDatasource {}

main() {
  PokemonDatasource? dataSource;
  PokemonRepositoryImpl? repository;
  PokemonSpecs? pokemonSpecsModel;
  PokemonModel? pokemonModel;

  setUp(() {
    dataSource = PokemonDataSourceMock();
    repository = PokemonRepositoryImpl(dataSource!);
    pokemonSpecsModel = PokemonSpecs(
        height: 0,
        name: faker.internet.userName(),
        photo: faker.image.image(),
        weight: 0);
    pokemonModel = PokemonModel(specs: pokemonSpecsModel!, name: '', url: '');
  });

  test('Deve retorna um lista com os pokemons', () async {
    when(() => dataSource!.getListPokemon(any()))
        .thenAnswer((_) async => <PokemonModel>[pokemonModel!]);

    final response = await repository!.getListPokemon(1);

    expect(response.fold((l) => null, (r) => r), isA<List<PokemonModel>>());
  });

  test('Deve retorna uma Failure SearchError', () async {
    when(() => dataSource!.getListPokemon(any()))
        .thenThrow((_) async => SearchError());

    final response = await repository!.getListPokemon(1);

    expect(response.fold((l) => l, (r) => null), isA<SearchError>());
  });
  test('Deve retornar uma Failure de ResultEmpty', () async {
    when(() => dataSource!.getListPokemon(any()))
        .thenAnswer((_) async => <PokemonModel>[]);

    final result = await repository!.getListPokemon(1);

    expect(result.fold((l) => l, (r) => []), isA<ResultEmpty>());
  });

  test('Deve retorna a spec do pokemons', () async {
    when(() => dataSource!.getSpecsPokemon(any()))
        .thenAnswer((_) async => pokemonSpecsModel!);

    final response =
        await repository!.getSpecsPokemon(faker.internet.uri('http'));

    expect(response.fold((l) => null, (r) => r), isA<PokemonSpecs>());
  });

  test('Deve retorna uma Failure GetSpecsError', () async {
    when(() => dataSource!.getSpecsPokemon(any()))
        .thenThrow((_) async => GetSpecsError());

    final response =
        await repository!.getSpecsPokemon(faker.internet.uri('http'));

    expect(response.fold((l) => l, (r) => null), isA<GetSpecsError>());
  });
}
