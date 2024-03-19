import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptRejectRequestController extends GetxController {
  TextEditingController authorization = TextEditingController();
  TextEditingController invoiceSerie = TextEditingController();
  TextEditingController invoiceAmount = TextEditingController();

  // Rx<AcceptRejectRequestModel> model = AcceptRejectRequestModel.emptyInit().obs;

  void fillInputs(Map<String, dynamic> data) {
    authorization.text = data["authorization"];
    invoiceSerie.text = data["invoiceSerie"];
    invoiceAmount.text = data["invoiceAmount"];
  }

  void clearInputs(){
    authorization.clear();
    invoiceSerie.clear();
    invoiceAmount.clear();
  }

}
