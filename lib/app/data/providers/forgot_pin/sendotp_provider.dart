import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class SendOtpProvider extends DioClient {
  Future<Response> sendOtp(FormData formData) async {
    return await post(EndPoint.sendOtp, data: formData);
  }
}