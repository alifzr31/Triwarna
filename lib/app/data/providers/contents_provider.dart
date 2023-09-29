import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class ContentsProvider extends DioClient {
  Future<Response> fetchContents() async {
    return await get(EndPoint.contents);
  }

  Future<Response> fetchDetailContent(slug) async {
    return await get('${EndPoint.content}/$slug');
  }
}
