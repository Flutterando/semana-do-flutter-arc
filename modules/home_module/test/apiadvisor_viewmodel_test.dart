import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/home_module.dart';
import 'package:home_module/src/models/apiadvisor_model.dart';
import 'package:home_module/src/viewmodels/apiadvisor_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

class ModuleMock extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IClientHttp>((i) => ClientHttpMockito()),
      ];

  @override
  List<Router> get routers => [];
}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(ModuleMock());

  initModule(HomeModule());
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
