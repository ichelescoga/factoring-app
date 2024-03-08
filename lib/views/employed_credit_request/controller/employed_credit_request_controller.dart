import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:developer_company/shared/validations/grater_than_number_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmployedCreditRequestController extends GetxController {
  TextEditingController client = TextEditingController();
  TextEditingController commissionRate = TextEditingController();
  TextEditingController amountAssignment = TextEditingController();
  TextEditingController employedCode = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController disbursementDate = TextEditingController();
  TextEditingController payPromiseDate = TextEditingController();
  TextEditingController commission = TextEditingController();
  TextEditingController discountAmount = TextEditingController();

  String? validateDateApplication(Object? value) {
    if (value == null) {
      return "El valor no puede ser nulo";
    }

    DateTime currentDate = DateTime.now();
    DateTime testDate;

    try {
      testDate = DateTime.parse(value.toString());
    } catch (e) {
      return "Formato de fecha no válido";
    }

    Duration difference = testDate.difference(currentDate);
    bool isDateValid = difference.inDays >= -60 && difference.inDays <= 60;

    if (!isDateValid) {
      return "La fecha debe estar dentro de los 60 días";
    }

    return null;
  }
}
