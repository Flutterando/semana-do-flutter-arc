import 'package:arch/app/interfaces/client_http_interface.dart';
import 'package:arch/app/models/apiadvisor_model.dart';
import 'package:arch/app/services/client_http_service.dart';
import 'package:arch/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arch/app/repositories/apiadvisor_repository.dart';
import 'package:mockito/mockito.dart';

class ClientHttpMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [
      ApiadvisorModel(country: "BR", date: "2020/05/30", text: "fdsff")
          .toJson(),
    ];
  }
}

class ClientHttpErrorMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  final mock = ClientHttpMockito();

  final viewModel = ApiadvisorViewModel(
    ApiadvisorRepository(
      mock,
    ),
  );

  group("ApiAdvisorViewModel", () {
    test('ApiAdvisorViewModel error', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenThrow(Exception("error"));

      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(mock.get(
              "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f"))
          .thenAnswer((_) => Future.value([
                ApiadvisorModel(
                        country: "BR", date: "2020/05/30", text: "fdsff")
                    .toJson(),
              ]));
      await viewModel.fill();
      expect(viewModel.apiadvisorModel.value, isA<ApiadvisorModel>());
    });
  });
}
