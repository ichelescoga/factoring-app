import 'package:developer_company/shared/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerRangeController extends BaseController {
  final TextEditingController name = TextEditingController();
  final TextEditingController maxAmount = TextEditingController();
  final TextEditingController minTime = TextEditingController();
  final TextEditingController maxTime = TextEditingController();
  final TextEditingController employedClass = TextEditingController();
  final TextEditingController commissionRate = TextEditingController();
  final formKey = GlobalKey<FormState>();
}

class RegisterCustomerRangeController extends GetxController {
  final TextEditingController client = TextEditingController();
  final TextEditingController amountAssignment = TextEditingController();
  final TextEditingController daysOfCredit = TextEditingController();
  RxList<CustomerRangeController> listRange =
      RxList<CustomerRangeController>([]);
  void addRange() {
    final ctrlInstance = CustomerRangeController();
    listRange.add(ctrlInstance);
  }
}
