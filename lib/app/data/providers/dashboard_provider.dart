import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class DashboardProvider extends DioClient {
  Future<Response> sendDeviceToken() async {
    return await get(EndPoint.fcmtoken);
  }
  
  Future<Response> fetchProfile() async {
    return await get(EndPoint.profile);
  }

  Future<Response> fetchContent() async {
    return await get(EndPoint.content);
  }
  
  Future<Response> fetchLottery(page, limit) async {
    return await get(
      EndPoint.lottery,
      queryParams: {
        'page': page,
        'limit': limit,
      },
    );
  }

  Future<Response> fetchStore(lat, long) async {
    return await get(
      EndPoint.store,
      queryParams: {
        'lat': lat,
        'long': long,
      },
    );
  }
}
