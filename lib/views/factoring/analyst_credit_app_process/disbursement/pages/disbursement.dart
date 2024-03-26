import 'package:developer_company/widgets/custom_horizontal_divider.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_animated_expand_card.dart';
import 'package:developer_company/widgets/custom_button_rezisable_widget.dart';
import 'package:developer_company/views/factoring/analyst_credit_app_process/disbursement/controller/disbursement_controller.dart';

class FactoringDisbursementPage extends StatefulWidget {
  const FactoringDisbursementPage({Key? key}) : super(key: key);

  @override
  State<FactoringDisbursementPage> createState() =>
      _FactoringDisbursementPageState();
}

class _FactoringDisbursementPageState extends State<FactoringDisbursementPage> {
  late FactoringDisbursementController controller;
  late Responsive responsive;

  bool requestHasChange = false;
  bool isFormOpen = false;
  String REQUEST_APPROVED = "3";
  String REQUEST_DENIED = "4";

  void handleFormOpen(bool action) {
    isFormOpen = true;
    setState(() {});
  }

  approveRequest() async {}

  deniedRequest() async {}

  @override
  void initState() {
    super.initState();
    controller = Get.put(FactoringDisbursementController());
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Desembolso pendiente",
      ),
      sideBarList: <SideBarItem>[],
      child: Column(
        children: [
          CustomAnimatedExpandCard(
            child: Center(),
            title: "Historial",
            subtitle: "Créditos",
            onTap: handleFormOpen,
          ),
          CustomAnimatedExpandCard(
            child: Center(),
            title: "Resumen",
            subtitle: "Análisis",
            onTap: handleFormOpen,
          ),
          CustomHorizontalDivider(label: "Balance"),
          CustomInputWidget(
              controller: controller.utilization,
              label: "Utilización",
              hintText: "Utilización",
              enabled: false,
              prefixIcon: Icons.currency_exchange),
          CustomInputWidget(
              controller: controller.amountInterest,
              label: "Intereses",
              hintText: "Intereses",
              enabled: false,
              prefixIcon: Icons.percent),
          CustomInputWidget(
              controller: controller.commissions,
              label: "Comisión",
              hintText: "Comisión",
              enabled: false,
              prefixIcon: Icons.monetization_on),
          CustomInputWidget(
              controller: controller.iva,
              label: "IVA",
              hintText: "IVA",
              enabled: false,
              prefixIcon: Icons.money_off_csred),
          CustomInputWidget(
              controller: controller.discounts,
              label: "Total descuento",
              hintText: "Total descuento",
              enabled: false,
              prefixIcon: Icons.money_off_csred),
          CustomInputWidget(
              controller: controller.disbursement,
              label: "Desembolso",
              hintText: "Desembolso",
              enabled: false,
              prefixIcon: Icons.monetization_on),
          CustomHorizontalDivider(label: "Generar lote trasferencia"),
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
                    onTap: () => _showModalApprove(context, REQUEST_APPROVED)),
              if (requestHasChange)
                Expanded(
                    child: CustomButtonWidget(
                        text: "Regresar",
                        onTap: () => Navigator.of(context).pop())),
            ],
          ),
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
