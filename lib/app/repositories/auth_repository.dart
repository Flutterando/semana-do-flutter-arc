import 'dart:convert';

import 'package:arch/app/interfaces/auth_interface.dart';
import 'package:arch/app/models/auth_model.dart';
import 'package:arch/app/models/user_model.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:dio/dio.dart';

class AuthRepository implements IAuth {
  final ClientHttp client;

  AuthRepository(this.client);

  @override
  Future<UserModel> login(AuthModel auth) async {
    String credencials = "${auth.email}:${auth.password}";
    credencials = base64.encode(credencials.codeUnits);

    var response = await client.post('/login',
        options: Options(headers: {"Authorization": "Basic $credencials"}));

    return UserModel.fromJson(response.data);
  }
}
