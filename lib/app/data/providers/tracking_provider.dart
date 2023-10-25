import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class TrackingProvider extends DioClient {
  Future<Response> fetchTracking(serialNumber) async {
    return await get('${EndPoint.voucher}/$serialNumber');
  }
}