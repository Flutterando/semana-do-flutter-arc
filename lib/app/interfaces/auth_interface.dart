import 'package:arch/app/models/auth_model.dart';
import 'package:arch/app/models/user_model.dart';

abstract class IAuth {
  Future<UserModel> login(AuthModel user);
}
