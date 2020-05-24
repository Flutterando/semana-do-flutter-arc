import 'package:arch/app/services/shared_local_storage_service.dart';
import 'package:flutter/foundation.dart';

import 'interfaces/local_storage_interface.dart';
import 'models/appconfig_model.dart';

class AppController {
  static final AppController instance = AppController._();
  AppController._() {
    storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  final ILocalStorage storage = SharedLocalStorageService();

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
