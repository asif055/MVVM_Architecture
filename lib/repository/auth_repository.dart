
import 'package:mvvm_archit/data/network/BaseApiService.dart';
import 'package:mvvm_archit/data/network/networkApiService.dart';

import '../res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {

    // Calling getpostapi

    try{
      dynamic response = _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch(e) {
      throw e;
    }
  }
  // register api calling
  Future<dynamic> registerApi(dynamic data) async {

    try{
      dynamic response = _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch(e) {
      throw e;
    }
  }
}