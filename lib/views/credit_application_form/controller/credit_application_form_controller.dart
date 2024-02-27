import 'package:developer_company/data/models/image_model.dart';
import 'package:developer_company/data/providers/factorin_provider.dart';
import 'package:developer_company/utils/handle_upload_image.dart';
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
  final TextEditingController disbursementDate = TextEditingController();
  final TextEditingController payPromiseDate = TextEditingController();
  final TextEditingController daysOfCredit = TextEditingController();
  final TextEditingController commission= TextEditingController();
  final TextEditingController interestAmount = TextEditingController();
  final TextEditingController amountToDisbursed = TextEditingController();
  // final TextEditingController filename = TextEditingController();

  ImageToUpload filename = ImageToUpload(
    base64: null,
    needUpdate: true,
    link: "",
  );

  void setFatherId (String id) => _fatherId = id;


  String formatDate(String fechaDesembolsoString) {
  DateTime fechaDesembolso = DateTime.parse(fechaDesembolsoString);

  String fechaFormateada = DateFormat('dd/MM/yy').format(fechaDesembolso);

  return fechaFormateada;
}

  Future<void> sedCreditRequest(Function callback) async {
    String imageToSave = await saveImage(filename);

    Map<String, dynamic> body = {
    "empresa": client.text,
    "tasa_interes": interestPercent.text,
    "tasa_comision": commissionRate.text,
    "nit": billNit.text,
    "no_factura": billNumber.text ,
    "serie_factura": billSerie.text,
    "monto_factura": billAmount.text,
    "fecha_factura": formatDate(billDate.text.toString()),
    "monto_solicitado": applicationAmount.text,
    "fecha_desembolso": formatDate(disbursementDate.text.toString()),
    "fecha_pago": formatDate(payPromiseDate.text.toString()),
    "dias_credito": daysOfCredit.text ,
    "comision": commission.text,
    "intereses": interestAmount.text,
    "monto_desembolsar" : amountToDisbursed.text,
    "factura": imageToSave,
    "carta_representante": "imagen_carta.jpg",
    "id_entidad": _fatherId,
    "createdby": "1"
    };
    print(body);
    var response = await provider.postApplicationRequest(body);

    callback();
  }

}
