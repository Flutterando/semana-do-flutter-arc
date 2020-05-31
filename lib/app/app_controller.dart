import 'package:arch/app/services/shared_local_storage_service.dart';
import 'package:arch/app/viewmodels/change_theme_viewmodel.dart';
import 'package:flutter/foundation.dart';

class AppController {
  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel) {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
