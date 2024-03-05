import 'package:developer_company/shared/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:developer_company/widgets/date_picker.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/upload_button_widget.dart';
import 'package:developer_company/shared/validations/nit_validation.dart';
import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:developer_company/shared/validations/grater_than_number_validator.dart';
import 'package:developer_company/shared/validations/lower_than_number_validator%20copy.dart';
import 'package:developer_company/views/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:flutter/widgets.dart';

class FormCreditApplication extends StatelessWidget {
  FormCreditApplication({
    Key? key,
    required CreditApplicationFormController ctrl,
    required this.doAction,
  })  : _ctrl = ctrl,
        super(key: key);

  late Responsive responsive;

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
    responsive = Responsive.of(context);
    return Column(
      children: [
        CustomInputWidget(
            controller: _ctrl.client,
            label: "Cliente",
            hintText: "Cliente",
            enabled: false,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.person),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomInputWidget(
                  controller: _ctrl.interestPercent,
                  label: "Tasa de interés",
                  hintText: "Tasa de interés",
                  enabled: false,
                  validator: (value) => notEmptyFieldValidator(value),
                  prefixIcon: Icons.price_check),
            ),
            VerticalDivider(
              width: 5,
              thickness: 5,
              endIndent: 0,
              color: AppColors.secondaryMainColor,
            ),
            Expanded(
              child: CustomInputWidget(
                  controller: _ctrl.commissionRate,
                  label: "Tasa de comisión",
                  hintText: "Tasa de comisión",
                  enabled: false,
                  validator: (value) => notEmptyFieldValidator(value),
                  prefixIcon: Icons.monetization_on),
            ),
          ],
        ),
        CustomInputWidget(
            controller: _ctrl.amountAssignment,
            label: "Cupo asignado",
            hintText: "Cupo asignado",
            enabled: false,
            validator: (value) => notEmptyFieldValidator(value),
            prefixIcon: Icons.monetization_on),
        Text("Factura"),
        Divider(
          height: 20,
          thickness: 5,
          endIndent: 0,
          color: AppColors.secondaryMainColor,
        ),
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
          validator: _ctrl.validateBillDate,
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
        ),
        CustomInputWidget(
          controller: _ctrl.billAmount,
          label: "Monto de factura",
          hintText: "Monto de factura",
          prefixIcon: Icons.monetization_on,
          keyboardType: TextInputType.number,
          onFocusChangeInput: (hasFocus) {
            if (!hasFocus) {
              _ctrl.billAmount.text = quetzalesCurrency(_ctrl.billAmount.text);
            }
          },
          validator: _ctrl.validateBillAmount,
        ),
        Text("Monto solicitado"),
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
          validator: _ctrl.validateDisbursementDate,
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
        ),
        CustomDatePicker(
          controller: _ctrl.payPromiseDate,
          label: "Fecha de pago",
          hintText: "Fecha de pago",
          prefixIcon: Icons.date_range_outlined,
          validator: _ctrl.validatePayPromiseData,
          initialDate: DateTime.now(),
          firstDate: DateTime(actualYear - 60),
          lastDate: DateTime(actualYear + 1),
          onChange: _ctrl.updateDaysOfCredit,
        ),
        CustomInputWidget(
            controller: _ctrl.daysOfCredit,
            label: "Dias de crédito",
            hintText: "Dias de crédito",
            enabled: false,
            validator: (value) {
              if (int.tryParse(value!)! < 1) {
                return "Fecha de pago es invalida";
              }
              return null;
            },
            prefixIcon: Icons.abc),
        CustomInputWidget(
          controller: _ctrl.applicationPercent,
          label: "Porcentaje de monto solicitado",
          hintText: "Monto solicitado",
          keyboardType: TextInputType.number,
          prefixIcon: Icons.monetization_on,
          onFocusChangeInput: _ctrl.handleChangeApplicationPercent,
          validator: _ctrl.validateApplicationPercent,
        ),
        CustomInputWidget(
          controller: _ctrl.finalApplicationAmount,
          label: "Monto solicitado",
          hintText: "Monto solicitado",
          keyboardType: TextInputType.number,
          prefixIcon: Icons.monetization_on,
          onFocusChangeInput: (hasFocus) {
            if (!hasFocus) {
              _ctrl.finalApplicationAmount.text =
                  quetzalesCurrency(_ctrl.finalApplicationAmount.text);
              _ctrl.updateInterestAndCommissions();
            }
          },
          validator: _ctrl.validateApplicationAmount,
          enabled: false,
        ),
        Text("Detalle de desembolso"),
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
            enabled: false,
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.interestAmount,
            label: "Intereses",
            hintText: "Intereses",
            enabled: false,
            prefixIcon: Icons.monetization_on),
        CustomInputWidget(
            controller: _ctrl.amountToDisbursed,
            label: "Monto a desembolsar",
            hintText: "Monto a desembolsar",
            enabled: false,
            prefixIcon: Icons.monetization_on),
        LogoUploadWidget(
            icon: Icon(
              Icons.camera,
              color: Colors.white,
            ),
            enabled: true,
            uploadImageController: _ctrl.filename,
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
