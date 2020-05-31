import 'package:flutter/foundation.dart';
import 'package:home_module/src/viewmodels/apiadvisor_viewmodel.dart';

import 'models/apiadvisor_model.dart';

class HomeController {
  final ApiadvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiadvisorModel> get time => viewModel.apiadvisorModel;

  getTime() {
    viewModel.fill();
  }
}
