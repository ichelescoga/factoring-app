import 'package:developer_company/controllers/analyst_text_form_controller.dart';
import 'package:developer_company/shared/abstract/analyst_form_abs_controller.dart';
import 'package:get/get.dart';

class RecommendingAnalystFormController extends GetxController
    implements AnalystAbsFormController {
  @override
  AnalystTextFormController inputController = AnalystTextFormController();

  @override
  void updateDaysOfCredit(String _) {
    // TODO: implement updateDaysOfCredit
  }

  @override
  void updateInterestAndCommissions() {
    // TODO: implement updateInterestAndCommissions
  }

  @override
  String? validateApplicationAmount(String? value) {
    // TODO: implement validateApplicationAmount
    throw UnimplementedError();
  }

  @override
  String? validateApplicationPercent(String? value) {
    // TODO: implement validateApplicationPercent
    throw UnimplementedError();
  }

  @override
  String? validateBillAmount(String? value) {
    // TODO: implement validateBillAmount
    throw UnimplementedError();
  }

  @override
  String? validateBillDate(Object? value) {
    // TODO: implement validateBillDate
    throw UnimplementedError();
  }

  @override
  String? validateDaysOfCredit(String? value) {
    // TODO: implement validateDaysOfCredit
    throw UnimplementedError();
  }

  @override
  String? validateDisbursementDate(Object? value) {
    // TODO: implement validateDisbursementDate
    throw UnimplementedError();
  }

  @override
  String? validatePayPromiseData(Object? value) {
    // TODO: implement validatePayPromiseData
    throw UnimplementedError();
  }
}
