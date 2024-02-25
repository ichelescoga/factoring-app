import 'package:developer_company/data/providers/factorin_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreditApplicationFormController extends GetxController {
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
  final TextEditingController disbursementDate = TextEditingController();
  final TextEditingController payPromiseDate = TextEditingController();
  final TextEditingController daysOfCredit = TextEditingController();
  final TextEditingController commission= TextEditingController();
  final TextEditingController interestAmount = TextEditingController();
  final TextEditingController amountToDisbursed = TextEditingController();
  final TextEditingController filename = TextEditingController();

  Future<void> sedCreditRequest() async {
    Map<String, dynamic> body = {
    "empresa": client.text,
    "tasa_interes": interestPercent.text,
    "tasa_comision": commissionRate.text,
    "nit": billNit.text,
    "no_factura": billNumber.text ,
    "serie_factura": billSerie.text,
    "monto_factura": billAmount.text,
    "fecha_factura": billDate.text,
    "monto_solicitado": applicationAmount.text,
    "fecha_desembolso": disbursementDate.text,
    "fecha_pago": payPromiseDate.text,
    "dias_credito": daysOfCredit.text ,
    "comision": commission.text,
    "intereses": interestAmount.text,
    "monto_desembolsar" : amountToDisbursed.text,
    "factura": "imagenfactura.jpg",
    "carta_representante": "imagen_carta.jpg",
    "id_entidad": "47",
    "createdby": "1"
    };
    await provider.postApplicationRequest(body);
  }

}
