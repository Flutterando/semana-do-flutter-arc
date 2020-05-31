import 'apiadvisor_repository_interface.dart';
import '../models/apiadvisor_model.dart';
import 'package:core_module/core_module.dart' show IClientHttp;

class ApiadvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiadvisorRepository(this.client);

  @override
  Future<ApiadvisorModel> getTime() async {
    var json = await client.get(
        "http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=95a9cb1ae6b422e8d7b7a4fe634fb14f");

    ApiadvisorModel model = ApiadvisorModel.fromJson(json[0]);
    return model;
  }
}
