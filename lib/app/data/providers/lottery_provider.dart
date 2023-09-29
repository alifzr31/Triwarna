import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class LotteryProvider extends DioClient {
  Future<Response> fetchDetailLottery(noTransaction) async {
    return await get('${EndPoint.lottery}/$noTransaction');
  }
}