import 'dart:async';

class ChangeThemeBloc {
  final streamTheme = StreamController<bool>();

  dispose() {
    streamTheme.close();
  }
}
