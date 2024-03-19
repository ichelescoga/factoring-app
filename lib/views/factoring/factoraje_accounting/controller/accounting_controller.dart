import 'package:developer_company/data/models/factoring/factoraje_accounting_model.dart';
import 'package:developer_company/data/providers/factoring/factoring_provider.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AccountingFactorageController extends GetxController {
  FactoringProvider provider = FactoringProvider();
  late String _fatherId;
  RxList<AccountingModel> data = RxList<AccountingModel>([]);
  RxList<AccountingModel> dataFiltered = RxList<AccountingModel>([]);
  RxString footerLabel = "".obs;

  void setFatherId(String id) => _fatherId = id;

  Future<void> fetchData() async {
    data.clear();

    var _data1 = await provider.getAccountingById(int.parse(_fatherId), 3);
    var _data2 = await provider.getAccountingById(int.parse(_fatherId), 5);
    var _data3 = await provider.getAccountingById(int.parse(_fatherId), 6);
    var _data4 = await provider.getAccountingById(int.parse(_fatherId), 7);

    data.addAll([..._data1, ..._data2, ..._data3, ..._data4]);

    update();
  }
}
