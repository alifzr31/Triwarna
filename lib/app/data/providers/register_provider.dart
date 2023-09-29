import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class RegisterProvider extends DioClient {
  Future<Response> register(FormData formData) async {
    return await post(EndPoint.register, data: formData);
  }
}
