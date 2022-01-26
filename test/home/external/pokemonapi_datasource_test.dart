import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokebox/app/utils/variables/variables_global.dart';

class DioMock extends Mock implements Dio {}

main() {
  Dio? dio;

  setUp(() {
    dio = DioMock();
  });

  test('Deve fazer a consulta na api e retornar o response', () async {
    when(() => dio!.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(VariablesGlobals().responseApi),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
  });
}
