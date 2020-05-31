import 'package:arch/app/app_module.dart';
import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(AppModule(), changeBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);
  group("ApiAdvisorViewModel", () {
    test('ApiAdvisorViewModel error', () async {
      when(Modular.get<IClientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenThrow(Exception("error"));
      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(Modular.get<IClientHttp>().get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenAnswer((_) => Future.value([
                ApiadvisorModel(
                        country: "BR", date: "2020/05/30", text: "fdsff")
                    .toJson(),
              ]));
      final viewModel = Modular.get<ApiadvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
