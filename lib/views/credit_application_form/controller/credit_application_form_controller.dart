import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreditApplicationFormController extends GetxController {
  final TextEditingController client = TextEditingController();
  final TextEditingController interestPercent = TextEditingController();
  final TextEditingController commissionRate = TextEditingController();
  final TextEditingController amountAssignment = TextEditingController();

  final TextEditingController billNit = TextEditingController();
  final TextEditingController billCompany = TextEditingController();
  final TextEditingController billNumber = TextEditingController();
  final TextEditingController billSerie = TextEditingController();
  final TextEditingController billDate = TextEditingController();
  final TextEditingController billAmount = TextEditingController();

  final TextEditingController applicationAmount = TextEditingController();
  final TextEditingController disbursementDate = TextEditingController();
  final TextEditingController payPromiseDate = TextEditingController();
  final TextEditingController daysOfCredit = TextEditingController();
  final TextEditingController commission= TextEditingController();
  final TextEditingController interestAmount = TextEditingController();
  final TextEditingController amountToDisbursed = TextEditingController();
  final TextEditingController filename = TextEditingController();
}
