import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class PointProvider extends DioClient {
  Future<Response> fetchPoint() async {
    return await get(EndPoint.point);
  }

  Future<Response> fetchPrize() async {
    return await get(EndPoint.prize);
  }

  Future<Response> fetchAllStore() async {
    return await get(EndPoint.store);
  }
}
