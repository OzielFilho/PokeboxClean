import 'package:dio/dio.dart';
import 'package:pokebox/app/core/httpClient/dioClient.dart';

class DioClientImplementation implements HttpClient {
  final Dio dio;

  DioClientImplementation(this.dio);

  @override
  Future<HttpResponse> getRequest(String url) async {
    final response = await dio.get(url);

    return HttpResponse(data: response.data, statusCode: response.statusCode!);
  }
}
