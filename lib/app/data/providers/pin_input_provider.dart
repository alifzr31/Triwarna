import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class PinInputProvider extends DioClient {
  Future<Response> redeemPoint(FormData formData) async {
    return await post(EndPoint.redeemPoint, data: formData);
  }
}
