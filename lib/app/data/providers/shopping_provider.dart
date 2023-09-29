import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class ShoppingProvider extends DioClient {
  Future<Response> fetchShoppingHistory() async {
    return await get(EndPoint.shoppingHistory);
  }

  Future<Response> fetchDetailShoppingHistory(docnum) async {
    return await get('${EndPoint.shoppingHistory}/$docnum');
  }
}