import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class AuthProvider extends DioClient {
  Future<Response> verify(FormData formData) async {
    return await post(EndPoint.verify, data: formData);
  }
  
  Future<Response> logout() async {
    return await post(EndPoint.logout);
  }
}
