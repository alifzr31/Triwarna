import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class SendLinkProvider extends DioClient {
  Future<Response> sendLink(FormData formData) async {
    return await post(EndPoint.sendForgotPassword, data: formData);
  }

  Future<Response> verifyOtp(FormData formData) async {
    return await post(EndPoint.verifyOtpForgotPassword, data: formData);
  }
}
