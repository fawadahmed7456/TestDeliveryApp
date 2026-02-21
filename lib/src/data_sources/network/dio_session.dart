import 'package:dio/dio.dart';
import '../../src.dart';

class DioSession {
  final Dio client;
  DioSession({required this.client});

  Future<T> request<T>({
    required String endpoint,
    required String method,
    dynamic data,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      final response = await client.request(
        endpoint,
        data: data,
        options: Options(method: method),
      );
      return fromJson(response.data);
    } catch (e) {
      throw GeneralException(message: e.toString());
    }
  }
}
