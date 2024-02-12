import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class ResetPasswordProvider extends DioClient {
  Future<Response> resetPassword(FormData formData) async {
    return await post(EndPoint.resetPassword, data: formData);
  }
}