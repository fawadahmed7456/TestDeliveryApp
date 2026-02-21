import 'package:dio/dio.dart';
import '../src.dart';

class ApiClient {
  final Dio _dio;
  final Flavor flavor;

  ApiClient({
    required this.flavor,
  }) : _dio = di<Dio>();

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
}
