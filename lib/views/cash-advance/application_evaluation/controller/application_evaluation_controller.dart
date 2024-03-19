import 'package:developer_company/data/models/cash-advance/EmployedCreditRequest.dart';
import 'package:developer_company/data/providers/cash-advance/cash_advance_provider.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:get/get.dart';

class ApplicationEvaluationController extends GetxController {
  final CashAdvanceProvider provider = CashAdvanceProvider();
  RxList<EmployedCreditRequest> data = RxList<EmployedCreditRequest>([]);
  RxList<EmployedCreditRequest> dataFiltered =
      RxList<EmployedCreditRequest>([]);
  RxString footerLabel =
      "\nRevision de Empresa Actualización de Info. Garantías…".obs;

  Future<void> fetchData(String fatherId) async {
    data.clear();
    dataFiltered.clear();
    var tempData = await provider.getApplicationRequest(1, int.parse(fatherId));
    data.addAll(tempData);
    dataFiltered.addAll(tempData);
    update();
  }

  void getApplicationRequest(EmployedCreditRequest model) {
    Map<String, String> parameters = {
      "idRequest": "0 ",
      "authorization": model.id.toString(),
      "client": model.employedCode.toString(),
      "disbursement": model.amount.toString()
    };
    Get.toNamed(RouterPaths.CASH_ADVANCE_CUSTOMER_ACCEPT_REJECT_REQUEST,
        parameters: parameters);
  }
}
