import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:developer_company/shared/validations/grater_than_number_validator.dart';
import 'package:developer_company/shared/validations/lower_than_number_validator%20copy.dart';
import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/views/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/date_picker.dart';
import 'package:developer_company/widgets/upload_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormCreditApplication extends StatelessWidget {

  FormCreditApplication({
    Key? key,
    required CreditApplicationFormController ctrl,
    required this.doAction,
  })  : _ctrl = ctrl,
        super(key: key);

  final CreditApplicationFormController _ctrl;
  final VoidCallback doAction;
  int actualYear = DateTime.now().year;

  String? validateNumber(String? value) {
    if (value == null) return "Ingrese un numero valido";
    if (double.tryParse(value) == null) return "Numero no valido";
    return null;
  }

  String? currencyValidator(String? value) {
    final incomes = extractNumber(value!);

    final isValidMinMonths = graterThanNumberValidator(incomes, 1);
    final isValidMaxMonths = lowerThanNumberValidator(incomes, 150000);
    if (!isValidMinMonths) {
      return '${Strings.incomesMax} 0.0';
    }

    if (isValidMaxMonths) {
      return null;
    }
    return '${Strings.incomesMin} 150,000.00';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputWidget(
            controller: _ctrl.client,
            label: "Cliente",
            hintText: "Cliente",
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.person),
        CustomInputWidget(
            controller: _ctrl.interestPercent,
            label: "Tasa de interés",
            hintText: "Tasa de interés",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.price_check),
        CustomInputWidget(
            controller: _ctrl.commissionRate,
            label: "Tasa de comisión",
            hintText: "Tasa de comisión",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.amountAssignment,
            label: "Cupo asignado",
            hintText: "Cupo asignado",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        //divider
        CustomInputWidget(
            controller: _ctrl.billNit,
            label: "Nit",
            hintText: "Nit",
            validator: (value) => notEmptyFieldValidator(value),
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
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.numbers),
        CustomInputWidget(
            controller: _ctrl.billSerie,
            label: "Serie factura",
            hintText: "Serie factura",
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.abc),
        CustomDatePicker(
          controller: _ctrl.billDate,
          label: "Fecha de factura",
          hintText: "Fecha de factura",
          prefixIcon: Icons.date_range_outlined,
          validator: (value) {
            // bool isDateValid = daysOldValidator(value.toString(), 2);
            // if (!isDateValid) {
            //   return "La fecha debe ser mayor 2 días";
            // }
            if (value != null) return null;
            return "VALIDE CAMPOS";
          },
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
        ),
        //divider
        CustomInputWidget(
            controller: TextEditingController(
                text: quetzalesCurrency(_ctrl.applicationAmount.text)),
            label: "Monto solicitado",
            hintText: "Monto solicitado",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        CustomDatePicker(
          controller: _ctrl.disbursementDate,
          label: "Fecha de desembolso",
          hintText: "Fecha de desembolso",
          prefixIcon: Icons.date_range_outlined,
          validator: (value) {
            // bool isDateValid = daysOldValidator(value.toString(), 2);
            // if (!isDateValid) {
            //   return "La fecha debe ser mayor 2 días";
            // }
            if (value != null) return null;
            return "VALIDE CAMPOS";
          },
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
        ),
        CustomDatePicker(
          controller: _ctrl.payPromiseDate,
          label: "Fecha de pago",
          hintText: "Fecha de pago",
          prefixIcon: Icons.date_range_outlined,
          validator: (value) {
            // bool isDateValid = daysOldValidator(value.toString(), 2);
            // if (!isDateValid) {
            //   return "La fecha debe ser mayor 2 días";
            // }
            if (value != null) return null;
            return "VALIDE CAMPOS";
          },
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
        ),
        CustomInputWidget(
            controller: _ctrl.daysOfCredit,
            label: "Dias de crédito",
            hintText: "Dias de crédito",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.abc),
        CustomInputWidget(
            controller: _ctrl.commission,
            label: "Commission",
            hintText: "Commission",
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.interestAmount,
            label: "Intereses",
            hintText: "Intereses",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.amountToDisbursed,
            label: "Monto a desembolsar",
            hintText: "Monto a desembolsar",
            keyboardType: TextInputType.number,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        LogoUploadWidget(
            icon: Icon(
              Icons.camera,
              color: Colors.white,
            ),
            enabled: true,
            uploadImageController:_ctrl.filename,
            text: "Subir archivo",
            validator: (value) {
              if (value == null) return "Seleccione una imagen";
              return null;
            }),

        CustomButtonWidget(text: "Enviar solicitud", onTap: doAction),
      ],
    );
  }
}
