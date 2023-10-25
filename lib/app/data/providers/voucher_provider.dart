import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class VoucherProvider extends DioClient {
  Future<Response> fetchVoucher() async {
    return await get(EndPoint.voucher);
  }
}