import 'package:developer_company/data/models/common/image_model.dart';
import 'package:developer_company/data/providers/factoring/factoring_provider.dart';
import 'package:developer_company/shared/constants/factoring/components_body_keys.dart';
import 'package:developer_company/shared/services/quetzales_currency.dart';
import 'package:developer_company/shared/validations/grater_than_number_validator.dart';
import 'package:developer_company/utils/common/handle_upload_image.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreditApplicationFormController extends GetxController {
  late String _fatherId;

  final FactoringProvider provider = FactoringProvider();

  final TextEditingController client = TextEditingController();
  final TextEditingController interestPercent = TextEditingController();
  final TextEditingController commissionRate = TextEditingController();
  final TextEditingController amountAssignment = TextEditingController();

  final TextEditingController billNit = TextEditingController();
  final TextEditingController billCompany = TextEditingController();
  final TextEditingController billNumber = TextEditingController();
  final TextEditingController billSerie = TextEditingController();
  final TextEditingController billDate = TextEditingController();
  final TextEditingController billAmount = TextEditingController();

  final TextEditingController applicationAmount = TextEditingController();
  final TextEditingController applicationPercent = TextEditingController();
  final TextEditingController finalApplicationAmount = TextEditingController();
  final TextEditingController disbursementDate = TextEditingController();
  final TextEditingController payPromiseDate = TextEditingController();
  final TextEditingController daysOfCredit = TextEditingController(text: '0');
  final TextEditingController commission =
      TextEditingController(text: "Q 0.00");
  final TextEditingController interestAmount =
      TextEditingController(text: "Q 0.00");
  final TextEditingController amountToDisbursed =
      TextEditingController(text: "Q 0.00");
  // final TextEditingController filename = TextEditingController();

  ImageToUpload filename = ImageToUpload(
    base64: null,
    needUpdate: true,
    link: "",
  );

  void setFatherId(String id) => _fatherId = id;

  String formatDate(String _date) {
    DateTime _newDate = DateTime.parse(_date);

    String _formateDate = DateFormat('dd/MM/yy').format(_newDate);

    return _formateDate;
  }

  Future<void> getEntityById() async {
    var response = await provider.getEntityById(int.parse(_fatherId));
    if (response['success']) {
      var data = response["data"];
      client.text = data['nombre'];
      interestPercent.text =
          "${double.parse(data[ComponentBodyKey.interestRate].toString())} %"; //TODO verify if this field is interest pecercent or only intereset per month
      commissionRate.text =
          "${double.parse(data[ComponentBodyKey.commissionRate].toString())} %"; //TODO verify if this field is comission pecercent or only comission per month
      amountAssignment.text =
          "${quetzalesCurrency(data[ComponentBodyKey.amountAssignment].toString())}"; // data['43'].toString();
    }
  }

  Future<void> sedCreditRequest(Function callback) async {
    String imageToSave = await saveImage(filename);

    Map<String, dynamic> body = {
      "empresa": client.text,
      "tasa_interes": simpleNumberCurrency(interestPercent.text),
      "tasa_comision": simpleNumberCurrency(commissionRate.text),
      "nit": billNit.text,
      "no_factura": billNumber.text,
      "serie_factura": billSerie.text,
      "monto_factura": simpleNumberCurrency(billAmount.text),
      "fecha_factura": formatDate(billDate.text.toString()),
      "monto_solicitado": simpleNumberCurrency(finalApplicationAmount.text),
      "fecha_desembolso": formatDate(disbursementDate.text.toString()),
      "fecha_pago": formatDate(payPromiseDate.text.toString()),
      "dias_credito": daysOfCredit.text,
      "comision": simpleNumberCurrency(commission.text),
      "intereses": simpleNumberCurrency(interestAmount.text),
      "monto_desembolsar": simpleNumberCurrency(amountToDisbursed.text),
      "factura": imageToSave,
      "carta_representante": "imagen_carta.jpg",
      "id_entidad": _fatherId,
      "createdby": "1"
    };
    await provider.postApplicationRequest(body);

    callback();
  }

  void updateDaysOfCredit(String _) {
    try {
      DateTime startDate = DateTime.parse(disbursementDate.text);
      DateTime endDate = DateTime.parse(payPromiseDate.text);

      Duration difference = endDate.difference(startDate);
      int days = difference.inDays;

      daysOfCredit.text = days.toString();
      update();
    } catch (e) {
      print("Error al analizar las fechas: $e");
    }
  }

  void updateInterestAndCommissions() {
    try {
      double _daysOfCredit = double.parse(daysOfCredit.text);
      double _requestedAmount = extractDouble(finalApplicationAmount.text);

      //TODO disable if the calc of the requested amount is by percentage
      double _limitOfCredit = extractDouble(billAmount.text);
      double _percentOfCredit = (_requestedAmount / _limitOfCredit) * 100;

      applicationPercent.text = "$_percentOfCredit %";
      //end

      double _commissionRate = extractDouble(commissionRate.text);
      double _commission = (_requestedAmount * _commissionRate) / 100;

      commission.text = quetzalesCurrency(_commission.toString());

      double _interestRate = extractDouble(interestPercent.text);

      double _interesesPerDay = (_interestRate * 12) / 365;
      double _newInterestRate = (_interesesPerDay * _daysOfCredit) / 100;
      double _interestAmount = _requestedAmount * _newInterestRate;

      interestAmount.text = quetzalesCurrency(_interestAmount.toString());

      double _amountToDisbursed =
          _requestedAmount - (_commission + _interestAmount);

      amountToDisbursed.text = quetzalesCurrency(_amountToDisbursed.toString());
      update();
    } catch (err) {}
  }

  String? validateApplicationAmount(String? value) {
    final amount = extractNumber(value!);
    if (amount == null) {
      return "Verifique que el valor sea correcto";
    }

    final isValidMinMonths = graterThanNumberValidator(amount, 1);
    final finalAmount = extractNumber(billAmount.text);

    if (finalAmount != null) {
      double maxAmount = double.parse(finalAmount);
      final isValidMaxMonths = double.parse(amount) <= maxAmount;

      if (!isValidMinMonths) return 'El monto debe ser mayor 0';
      if (isValidMaxMonths) return null;
      return 'El monto debe ser menor a ${billAmount.text}';
    }
    return "Algo salio mal valide campos.";
  }

  String? validateBillAmount(String? value) {
    final amount = extractNumber(value!);
    if (amount == null) {
      return "Verifique que el valor sea correcto";
    }
    final validAmount = graterThanNumberValidator(amount, 1);
    if (!validAmount) return 'El monto debe ser mayor 0';
    return null;
  }

  String? validatePayPromiseData(Object? value) {
    DateTime currentDate = DateTime.now();
    DateTime testDate = DateTime.parse(value.toString());

    bool isDateValid = currentDate.compareTo(testDate) < 0;
    if (!isDateValid) {
      return "La fecha debe ser mayor a la fecha actual";
    }
    if (value != null) return null;
    return "VALIDE CAMPOS";
  }

  String? validateBillDate(Object? value) {
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

  String? validateApplicationPercent(String? value) {
    double number = extractDouble(value ?? "0");
    if (number <= 0) {
      return "Porcentaje debe ser mayor que 0";
    }
    if (number > 100) {
      return "Monto debe ser menor a 100 %";
    }
    return null;
  }

  void handleChangeApplicationPercent(bool hasFocus) {
    if (!hasFocus) {
      double _percent = extractDouble(applicationPercent.text);
      double _amount = extractDouble(billAmount.text);
      _amount = (_amount * _percent) / 100;

      applicationPercent.text = "$_percent %";
      finalApplicationAmount.text = quetzalesCurrency(_amount.toString());

      updateInterestAndCommissions();
    }
  }

  String? validateDisbursementDate(Object? value) {
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
    bool isDateValid = difference.inDays > 2;

    if (!isDateValid) {
      return "La fecha debe ser mayor a dos días";
    }

    return null;
  }
}
