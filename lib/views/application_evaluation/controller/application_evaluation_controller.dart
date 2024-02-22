import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/mocks/application_evaluation_mock.dart';
import 'package:get/get.dart';

class ApplicationEvaluationController extends GetxController {
  RxList<ApplicationEvalModel> data = RxList<ApplicationEvalModel>([]);
  RxList<ApplicationEvalModel> dataFiltered = RxList<ApplicationEvalModel>([]);
  RxString footerLabel = "\nRevision de Empresa Actualización de Info. Garantías…".obs;

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
}
