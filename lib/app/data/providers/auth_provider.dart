import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class AuthProvider extends DioClient {
  Future<Response> logout() async {
    return await post(EndPoint.logout);
  }
}
