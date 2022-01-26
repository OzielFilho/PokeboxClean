// ignore_for_file: file_names

abstract class HttpClient {
  Future<HttpResponse> getRequest(String url);
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
