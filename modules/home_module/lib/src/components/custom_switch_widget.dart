import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:core_module/core_module.dart' show ChangeThemeViewModel;

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: Modular.get<ChangeThemeViewModel>().config.themeSwitch,
        builder: (context, isDark, child) {
          return Switch(
            value: isDark,
            onChanged: Modular.get<ChangeThemeViewModel>().changeTheme,
          );
        });
  }
}
