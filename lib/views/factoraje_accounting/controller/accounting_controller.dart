import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/mocks/application_evaluation_mock.dart';
import 'package:get/get.dart';

class AccountingFactorageController extends GetxController {
  RxList<ApplicationEvalModel> data = RxList<ApplicationEvalModel>([]);
  RxList<ApplicationEvalModel> dataFiltered = RxList<ApplicationEvalModel>([]);
  RxString footerLabel =
      "".obs;
  Future<void> fetchData() async {
    data.clear();
    var list = ACCOUNTING_DATA
        .map((e) => ApplicationEvalModel.fromJson(e))
        .toList();
    data.addAll(list);
    dataFiltered.addAll(list);
    print(data.length);
    update();
  }
}
