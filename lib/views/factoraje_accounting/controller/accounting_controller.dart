import 'package:developer_company/data/models/factoraje_accounting_model.dart';
import 'package:developer_company/mocks/application_evaluation_mock.dart';
import 'package:get/get.dart';

class AccountingFactorageController extends GetxController {
  RxList<AccountingModel> data = RxList<AccountingModel>([]);
  RxList<AccountingModel> dataFiltered = RxList<AccountingModel>([]);
  RxString footerLabel =
      "".obs;
  Future<void> fetchData() async {
    data.clear();
    var list = ACCOUNTING_DATA
        .map((e) => AccountingModel.fromJson(e))
        .toList();
    data.addAll(list);
    dataFiltered.addAll(list);
    print(data.length);
    update();
  }
}
