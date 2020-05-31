import 'package:flutter/foundation.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/repositories/apiadvisor_repository_interface.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;

  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  ApiadvisorViewModel(this.repository);

  Future fill() async {
    try {
      apiadvisorModel.value = await repository.getTime();
    } catch (e) {}
  }
}
