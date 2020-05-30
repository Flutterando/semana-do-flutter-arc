import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/repositories/apiadvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

class ApiadvisorViewModel {
  final IApiAdvisor repository;

  final apiadvisorModel = ValueNotifier<ApiadvisorModel>(null);

  ApiadvisorViewModel(this.repository);

  fill() async {
    apiadvisorModel.value = await repository.getTime();
  }
}
