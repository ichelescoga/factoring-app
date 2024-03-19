import 'dart:convert';

import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/http_adapter.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/cash-advance/accept_reject_request/controller/accept_reject_request_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_rezisable_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AcceptRejectRequestPage extends StatefulWidget {
  const AcceptRejectRequestPage({Key? key}) : super(key: key);

  @override
  State<AcceptRejectRequestPage> createState() =>
      _AcceptRejectRequestPageState();
}

class _AcceptRejectRequestPageState extends State<AcceptRejectRequestPage> {
  late AcceptRejectRequestController controller;
  late Responsive responsive;

  String requestId = "";
  String REQUEST_APPROVED = "3";
  String REQUEST_DENIED = "4";
  bool requestHasChange = false;

  _approveRequest() async {
    HttpAdapter http = HttpAdapter();

    final response = await http.postApi(
        "solicituda/v1/updateEstadoSolicitud",
        json.encode({"id": requestId, "estado": REQUEST_APPROVED}),
        {'Content-Type': 'application/json'});
    if (response.statusCode == 202) {
      requestHasChange = true;
      Navigator.of(context).pop();
      setState(() {});
    }
  }

  _deniedRequest() async {
    HttpAdapter http = HttpAdapter();

    final response = await http.postApi(
        "solicituda/v1/updateEstadoSolicitud",
        json.encode({"id": requestId, "estado": REQUEST_DENIED}),
        {'Content-Type': 'application/json'});
    if (response.statusCode == 202) {
      requestHasChange = true;
      Navigator.of(context).pop();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(AcceptRejectRequestController());
    Map<String, dynamic> params = Get.parameters;
    controller.fillInputs(params);
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Solicitud de crédito",
      ),
      sideBarList: [],
      child: Column(
        children: [
          CustomInputWidget(
              controller: controller.authorization,
              label: "Autorización",
              hintText: "Autorización",
              enabled: false,
              prefixIcon: Icons.abc),
          CustomInputWidget(
              controller: controller.client,
              label: "Cliente",
              hintText: "Cliente",
              enabled: false,
              prefixIcon: Icons.person),
          CustomInputWidget(
              controller: controller.disbursement,
              label: "Monto aprobado",
              hintText: "Monto aprobado",
              enabled: false,
              prefixIcon: Icons.monetization_on),
          Text(
            "Aprobar o denegar",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w800,
                fontSize: responsive.dp(2.5)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonResizableWidget(
                  width: responsive.wp(35),
                  text: "Aprobar",
                  onTap: _approveRequest),
              CustomButtonResizableWidget(
                  width: responsive.wp(35),
                  color: AppColors.redColor,
                  text: "Denegar",
                  onTap: _deniedRequest)
            ],
          )
        ],
      ),
    );
  }
}
