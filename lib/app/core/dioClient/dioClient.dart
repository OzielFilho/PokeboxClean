// ignore_for_file: file_names

abstract class DioClient {
  Future<DioResponse> getRequest(String url);
}

class DioResponse {
  final dynamic data;
  final int statusCode;

  DioResponse({required this.data, required this.statusCode});
}
