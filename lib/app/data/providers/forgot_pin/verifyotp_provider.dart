import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class VerifyOtpProvider extends DioClient {
  Future<Response> verifyOtp(FormData formData) async {
    return await post(EndPoint.verifyOtp, data: formData);
  }

  Future<Response> resendOtp(FormData formData) async {
    return await post(EndPoint.sendOtp, data: formData);
  }
}
