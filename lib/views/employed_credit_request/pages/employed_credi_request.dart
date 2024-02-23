import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/views/employed_credit_request/controller/employed_credit_request_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmployedCreditRequestPage extends StatefulWidget {
  const EmployedCreditRequestPage({Key? key}) : super(key: key);

  @override
  State<EmployedCreditRequestPage> createState() =>
      _EmployedCreditRequestPageState();
}

class _EmployedCreditRequestPageState extends State<EmployedCreditRequestPage> {
  late EmployedCreditRequestController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(EmployedCreditRequestController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Solicitud de crédito anticipo",
      ),
      sideBarList: [],
      child: Column(
        children: [
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Cliente",
              hintText: "Cliente",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.person),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Tasa de commission",
              hintText: "Tasa de commission",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.monetization_on),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Cupo asignado",
              hintText: "Cupo asignado",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.monetization_on),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Código empleado",
              hintText: "Código empleado",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.person),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Fecha",
              hintText: "Fecha",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.calendar_month),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Monto",
              hintText: "Monto",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.monetization_on),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Fecha de desembolso",
              hintText: "Fecha de desembolso",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.calendar_month),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Fecha de pago",
              hintText: "Fecha de pago",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.person),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Commission",
              hintText: "Commission",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.monetization_on),
          CustomInputWidget(
              controller: _ctrl.client,
              label: "Monto a descontar",
              hintText: "Monto a descontar",
              validator: (value) {
                return notEmptyFieldValidator(value);
              },
              prefixIcon: Icons.monetization_on),
          CustomButtonWidget(text: "Enviar solicitud", onTap: () {})
        ],
      ),
    );
  }
}
