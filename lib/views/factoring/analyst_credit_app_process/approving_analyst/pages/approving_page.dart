import 'package:developer_company/shared/resources/strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/analyst_form_credi_appl.dart';
import 'package:developer_company/widgets/custom_animated_expand_card.dart';
import 'package:developer_company/widgets/custom_button_rezisable_widget.dart';
import 'package:developer_company/views/factoring/analyst_credit_app_process/approving_analyst/controller/approving_controller.dart';

class ApprovingAnalystPage extends StatefulWidget {
  const ApprovingAnalystPage({Key? key}) : super(key: key);

  @override
  State<ApprovingAnalystPage> createState() =>
      _ApprovingAnalystPageState();
}

class _ApprovingAnalystPageState extends State<ApprovingAnalystPage> {
  late ApprovingAnalystFormController controller;
  late Responsive responsive;

  final _formKey = GlobalKey<FormState>();

  String requestId = "";
  String REQUEST_APPROVED = "3";
  String REQUEST_DENIED = "4";
  bool requestHasChange = false;
  bool isFormOpen = false;

  _handleSubmitForm() {}

  approveRequest() async {}

  deniedRequest() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: Strings.loading);
    }
  }

  void handleFormOpen(bool action) {
    isFormOpen = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(ApprovingAnalystFormController());
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
      sideBarList: <SideBarItem>[],
      appBar: CustomAppBarSideBar(
        title: "Análisis de créditos",
      ),
      onBackFunction: () {
        Get.back(closeOverlays: true, result: true);
      },
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAnimatedExpandCard(
                title: "Resumen",
                subtitle: "Monto",
                onTap: handleFormOpen,
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
                        label: "Monto solicitado",
                        hintText: "Monto solicitado",
                        enabled: false,
                        prefixIcon: Icons.monetization_on),
                  ],
                )),
            CustomAnimatedExpandCard(
                title: "Solicitud",
                subtitle: "Detalles",
                onTap: handleFormOpen,
                child: AnalystFormCreditApplication(
                    controller: controller, doAction: _handleSubmitForm)),
            IgnorePointer(
              ignoring: !isFormOpen,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: CustomInputWidget(
                        controller: controller.comments,
                        label: "Comentario",
                        hintText: "Comentario",
                        validator: controller.commentsValidation,
                        prefixIcon: Icons.abc),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (!requestHasChange)
                        CustomButtonResizableWidget(
                            width: responsive.wp(35),
                            color: isFormOpen
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.5),
                            text: "Aprobar",
                            onTap: () =>
                                _showModalApprove(context, REQUEST_APPROVED)),
                      if (!requestHasChange)
                        CustomButtonResizableWidget(
                            width: responsive.wp(35),
                            color: isFormOpen
                                ? AppColors.redColor
                                : AppColors.redColor.withOpacity(0.5),
                            text: "Denegar",
                            onTap: () =>
                                _showModalApprove(context, REQUEST_DENIED)),
                      if (requestHasChange)
                        Expanded(
                            child: CustomButtonWidget(
                                text: "Regresar",
                                onTap: () => Navigator.of(context).pop())),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
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
