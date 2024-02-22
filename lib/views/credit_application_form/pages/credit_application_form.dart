import 'package:developer_company/views/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreditApplicationFormPage extends StatefulWidget {
  const CreditApplicationFormPage({Key? key}) : super(key: key);

  @override
  State<CreditApplicationFormPage> createState() =>
      _CreditApplicationFormPageState();
}

class _CreditApplicationFormPageState extends State<CreditApplicationFormPage> {
  late CreditApplicationFormController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(CreditApplicationFormController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      sideBarList: <SideBarItem>[],
      appBar: CustomAppBarSideBar(
        title: "Solicitud de crédito",
      ),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CustomInputWidget(
                controller: _ctrl.client,
                label: "Cliente",
                hintText: "Cliente",
                prefixIcon: Icons.person),
            CustomInputWidget(
                controller: _ctrl.interestPercent,
                label: "Tasa de interés",
                hintText: "Tasa de interés",
                prefixIcon: Icons.price_check),
            CustomInputWidget(
                controller: _ctrl.commissionRate,
                label: "Commission",
                hintText: "Commission",
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.amountAssignment,
                label: "Cupo asignado",
                hintText: "Cupo asignado",
                prefixIcon: Icons.monetization_on),
            //divider
            CustomInputWidget(
                controller: _ctrl.billNit,
                label: "Nit",
                hintText: "Nit",
                prefixIcon: Icons.perm_identity),
            CustomInputWidget(
                controller: _ctrl.billCompany,
                label: "Empresa",
                hintText: "Empresa",
                prefixIcon: Icons.business),
            CustomInputWidget(
                controller: _ctrl.billNumber,
                label: "No. Factura",
                hintText: "No. Factura",
                prefixIcon: Icons.numbers),
            CustomInputWidget(
                controller: _ctrl.billSerie,
                label: "Serie factura",
                hintText: "Serie factura",
                prefixIcon: Icons.abc),
            //divider
            CustomInputWidget(
                controller: _ctrl.applicationAmount,
                label: "Monto solicitado",
                hintText: "Monto solicitado",
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.disbursementDate,
                label: "Fecha de desembolso",
                hintText: "Fecha de desembolso",
                prefixIcon: Icons.calendar_month),
            CustomInputWidget(
                controller: _ctrl.payPromiseDate,
                label: "Fecha de pago",
                hintText: "Fecha de pago",
                prefixIcon: Icons.date_range),
            CustomInputWidget(
                controller: _ctrl.daysOfCredit,
                label: "Dias de crédito",
                hintText: "Dias de crédito",
                prefixIcon: Icons.abc),
            CustomInputWidget(
                controller: _ctrl.commission,
                label: "Commission",
                hintText: "Commission",
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.interestAmount,
                label: "Intereses",
                hintText: "Intereses",
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.amountToDisbursed,
                label: "Monto a desembolsar",
                hintText: "Monto a desembolsar",
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.filename,
                label: "Subir archivo",
                hintText: "Subir archivo",
                prefixIcon: Icons.file_copy),
          ],
        ),
      )),
    );
  }
}
