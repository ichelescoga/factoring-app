import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/views/employed_credit_request/controller/employed_credit_request_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_dropdown_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/date_picker.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EmployedCreditRequestPage extends StatefulWidget {
  const EmployedCreditRequestPage({Key? key}) : super(key: key);

  @override
  State<EmployedCreditRequestPage> createState() =>
      _EmployedCreditRequestPageState();
}

class _EmployedCreditRequestPageState extends State<EmployedCreditRequestPage> {
  late EmployedCreditRequestController _ctrl;

  final _formKey = GlobalKey<FormState>();

  int actualYear = DateTime.now().year;

  _handleSubmitForm() {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: Strings.loading);
      _ctrl.sendCashAdvanceRequest(getBack);
    }
  }

  void getBack() {
    EasyLoading.dismiss();
    Navigator.pop(context);
  }



  @override
  void initState() {
    super.initState();
    var args = Get.arguments;
    var id = args['father'];
    EasyLoading.show(status: Strings.loading);
    _ctrl = Get.put(EmployedCreditRequestController());
    _ctrl.setFatherId(id);
    _ctrl.start(() => EasyLoading.dismiss());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Solicitud de crédito anticipo",
      ),
      sideBarList: [],
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomInputWidget(
                controller: _ctrl.client,
                label: "Colaborador",
                hintText: "Colaborador",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.person),
            CustomInputWidget(
                controller: _ctrl.clientTypeRange,
                label: "Rango",
                hintText: "Rango",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.group),
            CustomInputWidget(
                controller: _ctrl.commissionRate,
                label: "Tasa de commission",
                hintText: "Tasa de commission",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.amountAssignment,
                label: "Cupo asignado",
                hintText: "Cupo asignado",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.employedCode,
                label: "Código empleado",
                hintText: "Código empleado",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.perm_identity),
            CustomDatePicker(
              controller: _ctrl.date,
              label: "Fecha App",
              hintText: "Fecha App",
              prefixIcon: Icons.date_range_outlined,
              validator: _ctrl.validateDateApplication,
              initialDate: DateTime.now(),
              firstDate: DateTime(actualYear - 60),
              lastDate: DateTime(actualYear + 1),
              enabled: false,
            ),
            Text("Datos de factura"),
            Divider(
              height: 20,
              thickness: 5,
              endIndent: 0,
              color: AppColors.secondaryMainColor,
            ),
            CustomInputWidget(
                controller: _ctrl.amount,
                label: "Monto",
                hintText: "Monto",
                validator: _ctrl.validateApplicationAmount,
                // onChange: () => _ctrl.updateCommissions(),
                onFocusChangeInput: _ctrl.updateCommissions,
                prefixIcon: Icons.monetization_on),
            Text("Desembolso"),
            Divider(
              height: 20,
              thickness: 5,
              endIndent: 0,
              color: AppColors.secondaryMainColor,
            ),
            CustomDatePicker(
              controller: _ctrl.disbursementDate,
              label: "Fecha de desembolso",
              hintText: "Fecha de desembolso",
              prefixIcon: Icons.date_range_outlined,
              validator: _ctrl.validateDateApplication,
              initialDate: DateTime.now(),
              firstDate: DateTime(actualYear - 60),
              lastDate: DateTime(actualYear + 1),
            ),
            CustomDatePicker(
              controller: _ctrl.payPromiseDate,
              label: "Fecha de pago",
              hintText: "Fecha de pago",
              prefixIcon: Icons.date_range_outlined,
              validator: _ctrl.validateDateApplication,
              onChange: _ctrl.onChangePayDate,
              initialDate: DateTime.now(),
              firstDate: DateTime(actualYear - 60),
              lastDate: DateTime(actualYear + 1),
            ),
            Text("Comisión"),
            Divider(
              height: 20,
              thickness: 5,
              endIndent: 0,
              color: AppColors.secondaryMainColor,
            ),
            CustomInputWidget(
                controller: _ctrl.commission,
                label: "Comisión",
                hintText: "Comisión",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.monetization_on),
            CustomInputWidget(
                controller: _ctrl.discountAmount,
                label: "Monto a descontar",
                hintText: "Monto a descontar",
                validator: (value) {
                  return notEmptyFieldValidator(value);
                },
                readOnly: true,
                prefixIcon: Icons.monetization_on),
            CustomButtonWidget(
                text: "Enviar solicitud", onTap: _handleSubmitForm)
          ],
        ),
      ),
    );
  }
}
