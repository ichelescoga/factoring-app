import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/data/providers/cash_advance_provider.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:get/get.dart';

class ApplicationEvaluationController extends GetxController {
  final CashAdvanceProvider provider = CashAdvanceProvider();
  RxList<ApplicationEvalModel> data = RxList<ApplicationEvalModel>([]);
  RxList<ApplicationEvalModel> dataFiltered = RxList<ApplicationEvalModel>([]);
  RxString footerLabel =
      "\nRevision de Empresa Actualización de Info. Garantías…".obs;

  Future<void> fetchData(String fatherId) async {
    data.clear();
    dataFiltered.clear();
    var tempData = await provider.getApplicationRequest(fatherId);
    data.addAll(tempData);
    dataFiltered.addAll(tempData);
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