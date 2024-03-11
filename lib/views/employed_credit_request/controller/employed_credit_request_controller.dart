import 'dart:async';

import 'package:developer_company/data/providers/cash_advance_provider.dart';
import 'package:developer_company/shared/helpers/extractNumber.dart';
import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EmployRange {
  int id;
  String name;
  double maxAmount;
  double commission;
  int maxTime;
  int minTime;
  String classType;

  EmployRange({
    required this.id,
    required this.name,
    required this.commission,
    required this.maxAmount,
    required this.maxTime,
    required this.minTime,
    required this.classType,
  });

  factory EmployRange.fromJson(Map<String, dynamic> json) {
    return EmployRange(
        id: json['Id'],
        name: json['Nombre'],
        commission: json['Tasa_comision'],
        maxAmount: double.parse(json['Maximo'].toString() ?? "0"),
        maxTime: json['Tiempo_maximo'],
        minTime: json['Tiempo_minimo'],
        classType: json['Empleado']);
  }
}

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

  RxList<EmployRange> rangeList = RxList<EmployRange>([]);

  void setFatherId(String value) => _fatherId = value;

  Future<void> start(Function callBack) async {
    var resultUser = await provider.getUserInformation(_fatherId);
    if (resultUser['success']) {
      var values = resultUser['data'];
      client.text = values['empleado_nombre'];
      employedCode.text = values['empleado_codigo'];
      _rangeId = values['empleado_rangoId'];

      var resultRange = await provider.getUserRango(_rangeId);
      if (resultRange['success']) {
        var _range = resultRange['data'];
        amountAssignment.text = quetzalesCurrency(_range['Maximo'].toString());
        commissionRate.text = "${_range['Tasa_comision']} %";
        clientTypeRange.text = _range['Empleado'];
        maxTimeOfCredit.text = _range['Tiempo_maximo'].toString();
        minTimeOfCredit.text = _range['Tiempo_minimo'].toString();
      }
    }
    callBack();
  }

  Future<void> sendCashAdvanceRequest(Function callBack) async {
    final Map<String, dynamic> body = {
      "tasa_comision": extractDouble(commission.text),
      "codigo_empleado": employedCode.text,
      "monto": simpleNumberCurrency(amount.text),
      "fecha": formatDateGt(date.text),
      "fecha_desembolso": formatDateGt(disbursementDate.text),
      "fecha_pago": formatDateGt(payPromiseDate.text),
      "comision": simpleNumberCurrency(commission.text),
      "monto_a_descontar": simpleNumberCurrency(discountAmount.text),
      "id_entidad": _fatherId,
      "createdby": '1'//TODO REPLACE FOR LOGGED USER ID
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
    updateCommissions(false);
  }

  void updateCommissions(bool focus) {
    if (!focus) {
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
}
