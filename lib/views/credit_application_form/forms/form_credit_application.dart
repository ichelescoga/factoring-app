import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:developer_company/shared/validations/nit_validation.dart';
import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/shared/validations/percentage_validator.dart';
import 'package:developer_company/views/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormCreditApplication extends StatelessWidget {
  const FormCreditApplication({
    Key? key,
    required CreditApplicationFormController ctrl,
    required this.doAction,
  })  : _ctrl = ctrl,
        super(key: key);

  final CreditApplicationFormController _ctrl;
  final VoidCallback doAction;

  String? validateNumber(String? value) {
    if (value == null) return "Ingrese un numero valido";
    if (double.tryParse(value) == null) return "Numero no valido";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            controller: _ctrl.interestPercent,
            label: "Tasa de interés",
            hintText: "Tasa de interés",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (percentageValidator(value)) {
                return "Porcentaje invalido";
              }
              return null;
            },
            prefixIcon: Icons.price_check),
        CustomInputWidget(
            controller: _ctrl.commissionRate,
            label: "Commission",
            hintText: "Commission",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.amountAssignment,
            label: "Cupo asignado",
            hintText: "Cupo asignado",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.monetization_on),
        //divider
        CustomInputWidget(
            controller: _ctrl.billNit,
            label: "Nit",
            hintText: "Nit",
            validator: (value) => nitValidation(value),
            prefixIcon: Icons.perm_identity),
        CustomInputWidget(
            controller: _ctrl.billCompany,
            label: "Empresa",
            hintText: "Empresa",
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.business),
        CustomInputWidget(
            controller: _ctrl.billNumber,
            label: "No. Factura",
            hintText: "No. Factura",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.numbers),
        CustomInputWidget(
            controller: _ctrl.billSerie,
            label: "Serie factura",
            hintText: "Serie factura",
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.abc),
        //divider
        CustomInputWidget(
            controller: TextEditingController(
                text: quetzalesCurrency(_ctrl.applicationAmount.text)),
            label: "Monto solicitado",
            hintText: "Monto solicitado",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.disbursementDate,
            label: "Fecha de desembolso",
            hintText: "Fecha de desembolso",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.calendar_month),
        CustomInputWidget(
            controller: _ctrl.payPromiseDate,
            label: "Fecha de pago",
            hintText: "Fecha de pago",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.date_range),
        CustomInputWidget(
            controller: _ctrl.daysOfCredit,
            label: "Dias de crédito",
            hintText: "Dias de crédito",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.abc),
        CustomInputWidget(
            controller: _ctrl.commission,
            label: "Commission",
            hintText: "Commission",
            validator: (value) => validateNumber(value),
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.interestAmount,
            label: "Intereses",
            hintText: "Intereses",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.amountToDisbursed,
            label: "Monto a desembolsar",
            hintText: "Monto a desembolsar",
            keyboardType: TextInputType.number,
            validator: (value) {
              return validateNumber(value);
            },
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.filename,
            label: "Subir archivo",
            hintText: "Subir archivo",
            prefixIcon: Icons.file_copy),
        CustomButtonWidget(text: "Enviar solicitud", onTap: doAction),
      ],
    );
  }
}
