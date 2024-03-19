import 'package:developer_company/controllers/analyst_text_form_controller.dart';
import 'package:developer_company/data/models/accounting_model.dart';
import 'package:developer_company/shared/abstract/analyst_form_abs_controller.dart';
import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovingAnalystFormController extends GetxController
    implements AnalystAbsFormController {
  @override
  AnalystTextFormController inputController = AnalystTextFormController();
  TextEditingController authorization = TextEditingController();
  TextEditingController invoiceSerie = TextEditingController();
  TextEditingController invoiceAmount = TextEditingController();
  TextEditingController comments = TextEditingController();

  TextEditingController interestRate = TextEditingController();
  TextEditingController commissionRate = TextEditingController();

  RxList<AccountingModel> data = RxList<AccountingModel>([]);

  @override
  void updateDaysOfCredit(String _) {
    return notEmptyFieldValidator(_);
  }

  @override
  void updateInterestAndCommissions() {}

  @override
  String? validateApplicationAmount(String? value) {
    return notEmptyFieldValidator(value);
  }

  @override
  String? validateApplicationPercent(String? value) {
    return notEmptyFieldValidator(value);
  }

  @override
  String? validateBillAmount(String? value) {
    return notEmptyFieldValidator(value);
  }

  @override
  String? validateBillDate(Object? value) {
    return null;
  }

  @override
  String? validateDaysOfCredit(String? value) {
    return notEmptyFieldValidator(value);
  }

  @override
  String? validateDisbursementDate(Object? value) {
    return null;
  }

  @override
  String? validatePayPromiseData(Object? value) {
    return null;
  }

  String? commentsValidation(String? value) {
    return notEmptyFieldValidator(value);
  }
}
