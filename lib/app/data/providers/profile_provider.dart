import 'package:dio/dio.dart';
import 'package:triwarna_rebuild/app/core/utils/api_url.dart';
import 'package:triwarna_rebuild/app/core/utils/dio_client.dart';

class ProfileProvider extends DioClient {
  Future<Response> fetchKelurahan() async {
    return await get(EndPoint.kelurahan);
  }

  Future<Response> editProfile(FormData formData) async {
    return await post(EndPoint.editProfile, data: formData);
  }

  Future<Response> changePass(FormData formData) async {
    return await post(EndPoint.changePass, data: formData);
  }

  Future<Response> createPin(FormData formData) async {
    return await post(EndPoint.createPin, data: formData);
  }

  Future<Response> changePin(FormData formData) async {
    return await post(EndPoint.changePin, data: formData);
  }

  Future<Response> deleteAccountOtp() async {
    return await post(EndPoint.deleteAccountOtp);
  }

  Future<Response> deleteAccount(FormData formData) async {
    return await post(EndPoint.deleteAccount, data: formData);
  }
}
