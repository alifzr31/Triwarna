import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/configs/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioClient {
  late Dio dio;
  String? token;

  DioClient() {
    dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
    configureDio();
  }

  void configureDio() async {
    dio.options.headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    dio.options.connectTimeout = const Duration(minutes: 5);
    dio.options.receiveTimeout = const Duration(minutes: 5);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<Response> get(String path, {queryParams}) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParams,
      );

      return response;
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> post(String path,
      {dynamic data, dynamic queryParams}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParams,
      );

      return response;
    } catch (_) {
      rethrow;
    }
  }
}
