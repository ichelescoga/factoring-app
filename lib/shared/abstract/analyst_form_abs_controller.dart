import 'package:developer_company/controllers/analyst_text_form_controller.dart';

abstract class AnalystAbsFormController {
  AnalystTextFormController inputController = AnalystTextFormController();

  void updateDaysOfCredit(String _);
  void updateInterestAndCommissions();
  String? validateBillDate(Object? value);
  String? validateBillAmount(String? value);
  String? validateDaysOfCredit(String? value);
  String? validatePayPromiseData(Object? value);
  String? validateDisbursementDate(Object? value);
  String? validateApplicationAmount(String? value);
  String? validateApplicationPercent(String? value);
}
