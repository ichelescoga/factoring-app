import 'package:developer_company/data/models/factoring/application_evaluation_model.dart';
import 'package:developer_company/data/providers/factoring/factoring_provider.dart';
import 'package:developer_company/shared/constants/factoring/request_status.dart';
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

    if (isQuoteUpdate) {}
  }

  Future<void> fetchAll(int mode) async {
    data.clear();
    dataFiltered.clear();
    var tempData =
        await provider.getApplicationRequestByState(requestStatus(mode));
    data.addAll(tempData);
    dataFiltered.addAll(tempData);
    update();
  }

  String requestStatus(mode) {
    late String status;
    switch (mode) {
      case 1:
        {
          status = FacRequestStatus.ENTERED;
          break;
        }
      case 2:
        {
          status = FacRequestStatus.ANALYST;
          break;
        }
      case 3:
        {
          status = FacRequestStatus.APPROVED;
          break;
        }
      case 4:
        {
          status = FacRequestStatus.DISBURSEMENT;
          break;
        }
      case 5:
        {
          status = FacRequestStatus.INVOICED;
          break;
        }
      case 6:
        {
          status = FacRequestStatus.OUTSTANDING;
          break;
        }
      case 7:
        {
          status = FacRequestStatus.PAID;
          break;
        }
      case 8:
        {
          status = FacRequestStatus.CANCELED;
          break;
        }
      case 9:
        {
          status = FacRequestStatus.DENIED;
          break;
        }
      case 10:
        {
          status = FacRequestStatus.FINISHED;
          break;
        }
      default:
        status = FacRequestStatus.FINISHED;
    }
    return status;
  }
}
