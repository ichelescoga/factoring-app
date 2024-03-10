import 'dart:async';

import 'package:developer_company/data/providers/cash_advance_provider.dart';
import 'package:developer_company/shared/helpers/extractNumber.dart';
import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmployedCreditRequestController extends GetxController {
  CashAdvanceProvider provider = CashAdvanceProvider();
  late String _fatherId;
  int _daysOfCredit = 0;
  int _rangeId = 0;

  TextEditingController client = TextEditingController();
  TextEditingController clientTypeRange = TextEditingController();
  TextEditingController maxTimeOfCredit = TextEditingController();
  TextEditingController minTimeOfCredit = TextEditingController();
  TextEditingController commissionRate = TextEditingController();
  TextEditingController amountAssignment = TextEditingController();
  TextEditingController employedCode = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController disbursementDate = TextEditingController();
  TextEditingController payPromiseDate = TextEditingController();
  TextEditingController commission = TextEditingController();
  TextEditingController discountAmount = TextEditingController();

  void setFatherId(String value) => _fatherId = value;

  Future<void> start() async {
    var resultUser = await provider.getUserInformation(_fatherId);
    var resultRange = await provider.getUserRango(_fatherId);
    if (resultUser['success'] && resultRange['success']) {
      var values = resultUser['data'];
      var _range = resultRange['data'];
      client.text = values['nombre'];

      _rangeId = _range['Id'];
      amountAssignment.text = quetzalesCurrency(_range['Maximo'].toString());
      commissionRate.text = "${_range['Tasa_comision']} %";
      clientTypeRange.text = _range['Empleado'];
      maxTimeOfCredit.text = _range['Tiempo_maximo'].toString();
      minTimeOfCredit.text = _range['Tiempo_minimo'].toString();
    }
  }

  Future<void> sendCashAdvanceRequest(Function callBack) async {
    final Map body = {
      "tasa_comision": extractDouble(commission.text),
      "codigo_empleado": employedCode.text,
      "monto": simpleNumberCurrency(amount.text),
      "fecha": formatDateGt(date.text),
      "fecha_desembolso": formatDateGt(disbursementDate.text),
      "fecha_pago": formatDateGt(payPromiseDate.text),
      "comision": simpleNumberCurrency(commission.text),
      "monto_a_descontar": simpleNumberCurrency(discountAmount.text),
      "id_entidad": _fatherId,
      "createdby": '1'
    };

    var result = await provider.postApplicationRequest(body);
    if (result) {
      callBack();
    }
  }

  String? validateDateApplication(Object? value) {
    if (value == null) {
      return "El valor no puede ser nulo";
    }

    DateTime currentDate = DateTime.now();
    DateTime testDate;

    try {
      testDate = DateTime.parse(value.toString());
    } catch (e) {
      return "Formato de fecha no válido";
    }

    Duration difference = testDate.difference(currentDate);
    bool isDateValid = difference.inDays >= -60 && difference.inDays <= 60;

    if (!isDateValid) {
      return "La fecha debe estar dentro de los 60 días";
    }

    return null;
  }

  String? validateApplicationAmount(String? value) {
    if (value != null) {
      double _maxAmount = extractDouble(amountAssignment.text);
      double _amount = extractDouble(value);
      if (_amount > 0 && _amount <= _maxAmount) return null;
      return "Ingrese un valor valido mayor a 0 y menor o igual a $_maxAmount";
    }
    return "Ingrese monto solicitado";
  }

  void onChangePayDate(Object endDate) {
    DateTime _startDate = DateTime.parse(disbursementDate.text);
    DateTime _endDate = DateTime.parse(endDate.toString());

    Duration difference = _endDate.difference(_startDate);
    _daysOfCredit = difference.inDays;
    updateCommissions();
  }

  void updateCommissions() {
    try {
      double _requestedAmount = extractDouble(amount.text);

      double _commissionRate = extractDouble(commissionRate.text);
      double _commission = (_requestedAmount * _commissionRate) / 100;

      amount.text = quetzalesCurrency(_requestedAmount.toString());

      commission.text = quetzalesCurrency(_commission.toString());
      double _discountAmount = _requestedAmount + _commission;

      discountAmount.text = quetzalesCurrency(_discountAmount.toString());
      update();
    } catch (err) {}
  }
}
