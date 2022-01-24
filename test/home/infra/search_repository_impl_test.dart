import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/modules/home/domain/errors/errors.dart';
import 'package:pokebox/app/modules/home/infra/datasources/search_datasource.dart';
import 'package:pokebox/app/modules/home/infra/models/pokemon_model.dart';
import 'package:pokebox/app/modules/home/infra/repositories/search_repository_impl.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource {}

main() {
  SearchDatasource? dataSource;
  SearchRepositoryImpl? repository;
  PokemonModel? pokemonModel;
  setUp(() {
    dataSource = SearchDataSourceMock();
    repository = SearchRepositoryImpl(dataSource!);
    pokemonModel = PokemonModel(faker.internet.userName(), 1, 1);
  });

  test('Deve retorna um lista com os pokemons', () async {
    when(() => dataSource!.getPokemon(any()))
        .thenAnswer((_) async => <PokemonModel>[pokemonModel!]);

    final response = await repository!.getData(1);

    expect(response.fold((l) => null, (r) => r), isA<List<PokemonModel>>());
  });

  test('Deve retorna uma Failure SearchError', () async {
    when(() => dataSource!.getPokemon(any()))
        .thenThrow((_) async => SearchError());

    final response = await repository!.getData(1);

    expect(response.fold((l) => l, (r) => null), isA<SearchError>());
  });
  test('Deve retornar uma Failure de ResultEmpty', () async {
    when(() => dataSource!.getPokemon(any()))
        .thenAnswer((_) async => <PokemonModel>[]);

    final result = await repository!.getData(1);

    expect(result.fold((l) => l, (r) => []), isA<ResultEmpty>());
  });
}
