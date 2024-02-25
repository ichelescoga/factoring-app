import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/data/providers/factorin_provider.dart';
import 'package:developer_company/mocks/application_evaluation_mock.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:get/get.dart';

class ApplicationEvaluationController extends GetxController {
  final FactoringProvider provider = FactoringProvider();
  RxList<ApplicationEvalModel> data = RxList<ApplicationEvalModel>([]);
  RxList<ApplicationEvalModel> dataFiltered = RxList<ApplicationEvalModel>([]);
  RxString footerLabel =
      "\nRevision de Empresa Actualización de Info. Garantías…".obs;

  Future<void> fetchData() async {
    data.clear();
    var list = APPLICATION_EVAL_DATA
        .map((e) => ApplicationEvalModel.fromJson(e))
        .toList();
    data.addAll(list);
    dataFiltered.addAll(list);
    print(data.length);
    update();
  }

  void getApplicationRequest(ApplicationEvalModel model) {
    Map<String, String> parameters = {
      "idRequest": "0 ",
      "authorization": model.noAuthorization.toString(),
      "client": model.client,
      "disbursement": model.disbursement
    };
    Get.toNamed(RouterPaths.CUSTOMER_ACCEPT_REJECT_REQUEST,
        parameters: parameters);
  }
}
