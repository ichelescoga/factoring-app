import 'package:developer_company/data/models/accept_reject_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptRejectRequestController extends GetxController {
  TextEditingController authorization = TextEditingController();
  TextEditingController client = TextEditingController();
  TextEditingController disbursement = TextEditingController();

  Rx<AcceptRejectRequestModel> model = AcceptRejectRequestModel.emptyInit().obs;

  void fillInputs(Map<String, dynamic> data) {
    model.value = AcceptRejectRequestModel.fromJson(data);
    authorization.text = model.value.authorization;
    client.text = model.value.client;
    disbursement.text = model.value.disbursement;
    update();
  }
}