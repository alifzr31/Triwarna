import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class ResetPinProvider extends DioClient {
  Future<Response> resetPin(FormData formData) async {
    return await post(EndPoint.resetPin, data: formData);
  }
}