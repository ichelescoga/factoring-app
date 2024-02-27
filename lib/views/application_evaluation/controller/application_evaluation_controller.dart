import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/data/providers/factorin_provider.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:get/get.dart';

class ApplicationEvaluationController extends GetxController {
  final FactoringProvider provider = FactoringProvider();
  RxList<ApplicationEvalModel> data = RxList<ApplicationEvalModel>([]);
  RxList<ApplicationEvalModel> dataFiltered = RxList<ApplicationEvalModel>([]);
  RxString footerLabel =
      "\nRevision de Empresa Actualización de Info. Garantías…".obs;

  Future<void> fetchData(String fatherId, String state) async {
    data.clear();
    dataFiltered.clear();
    var tempData = await provider.getApplicationRequest(fatherId, state);
    data.addAll(tempData);
    dataFiltered.addAll(tempData);
    update();
  }

  void getApplicationRequest(ApplicationEvalModel model) async {
    Map<String, String> parameters = {
      "idRequest": "0",
      "authorization": model.noAuthorization.toString(),
      "invoiceSerie": model.invoiceSerie,
      "invoiceAmount": model.invoiceAmount,
      "requestId": model.requestId
    };
    final isQuoteUpdate = await Get.toNamed(
        RouterPaths.CUSTOMER_ACCEPT_REJECT_REQUEST,
        parameters: parameters);

    if (isQuoteUpdate) {  
      
    }
  }
}
