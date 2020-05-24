import 'package:dio/native_imp.dart';

class ClientHttp extends DioForNative {
  ClientHttp() {
    options.baseUrl = "https://5ecafaf138df960016511b4c.mockapi.io/api/v1";
  }
}
