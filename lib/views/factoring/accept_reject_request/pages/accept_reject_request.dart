import 'dart:convert';

import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/shared/utils/http_adapter.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/factoring/accept_reject_request/controller/accept_reject_request_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_rezisable_widget.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
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

  @override
  void initState() {
    super.initState();
    controller = Get.put(AcceptRejectRequestController());
    Map<String, dynamic> params = Get.parameters;
    controller.fillInputs(params);
    requestId = params["requestId"];
  }

  approveRequest() async {
    HttpAdapter http = HttpAdapter();

    final response = await http.postApi(
        "solicitud/v1/updateEstadoSolicitud",
        json.encode({"id": requestId, "estado": REQUEST_APPROVED}),
        {'Content-Type': 'application/json'});
    if (response.statusCode == 202) {
      requestHasChange = true;
      Navigator.of(context).pop();
      setState(() {});
    }
  }

  deniedRequest() async {
    HttpAdapter http = HttpAdapter();

    final response = await http.postApi(
        "solicitud/v1/updateEstadoSolicitud",
        json.encode({"id": requestId, "estado": REQUEST_DENIED}),
        {'Content-Type': 'application/json'});
    if (response.statusCode == 202) {
      requestHasChange = true;
      Navigator.of(context).pop();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
      onBackFunction: () {
        Get.back(closeOverlays: true, result: true);
      },
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
              controller: controller.invoiceSerie,
              label: "Serie factura",
              hintText: "Serie factura",
              enabled: false,
              prefixIcon: Icons.person),
          CustomInputWidget(
              controller: controller.invoiceAmount,
              label: "Monto aprobado",
              hintText: "Monto aprobado",
              enabled: false,
              prefixIcon: Icons.monetization_on),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (!requestHasChange)
                CustomButtonResizableWidget(
                    width: responsive.wp(35),
                    text: "Aprobar",
                    onTap: () => _showModalApprove(context, REQUEST_APPROVED)),
              if (!requestHasChange)
                CustomButtonResizableWidget(
                    width: responsive.wp(35),
                    color: AppColors.redColor,
                    text: "Denegar",
                    onTap: () => _showModalApprove(context, REQUEST_DENIED)),
              if (requestHasChange)
                Expanded(
                    child: CustomButtonWidget(
                        text: "Regresar",
                        onTap: () => Navigator.of(context).pop())),
            ],
          )
        ],
      ),
    );
  }

  _showModalApprove(BuildContext context, String state) {
    return showDialog(
        context: context,
        builder: ((BuildContext context) {
          return Center(
            child: Container(
              color: Colors.white,
              height: Get.height / 4,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        "¿Desea ${state == REQUEST_APPROVED ? "aprobar" : "denegar"}?",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Dimensions.extraLargeTextSize,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButtonWidget(
                                color: AppColors.blueColor,
                                text:
                                    "${state == REQUEST_APPROVED ? "Aprobar" : "Denegar"}",
                                onTap: () async {
                                  if (state == REQUEST_APPROVED) {
                                    approveRequest();
                                  }
                                  if (state == REQUEST_DENIED) {
                                    deniedRequest();
                                  }
                                })),
                        Expanded(
                            child: CustomButtonWidget(
                                text: "Regresar",
                                onTap: () => Navigator.of(context).pop()))
                      ],
                    )
                  ]),
            ),
          );
        }));
  }
}
