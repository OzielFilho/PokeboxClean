import 'package:dio/dio.dart';
import 'package:pokebox/app/core/dioClient/dioClient.dart';

class DioClientImplementation implements DioClient {
  final Dio dio;

  DioClientImplementation(this.dio);

  @override
  Future<DioResponse> getRequest(String url) async {
    final response = await dio.get(url);

    return DioResponse(data: response.data, statusCode: response.statusCode!);
  }
}
