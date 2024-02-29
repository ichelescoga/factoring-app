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
  final TextEditingController commission = TextEditingController();
  final TextEditingController interestAmount = TextEditingController();
  final TextEditingController amountToDisbursed = TextEditingController();
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
      interestPercent.text = data['38'].toString(); //TODO verify if this field is interest pecercent or only intereset per month
      commissionRate.text = data['39'].toString(); //TODO verify if this field is comission pecercent or only comission per month
      amountAssignment.text = data['42'].toString(); // data['43'].toString();
    }
  }

  Future<void> sedCreditRequest(Function callback) async {
    String imageToSave = await saveImage(filename);

    Map<String, dynamic> body = {
      "empresa": client.text,
      "tasa_interes": interestPercent.text,
      "tasa_comision": commissionRate.text,
      "nit": billNit.text,
      "no_factura": billNumber.text,
      "serie_factura": billSerie.text,
      "monto_factura": billAmount.text,
      "fecha_factura": formatDate(billDate.text.toString()),
      "monto_solicitado": applicationAmount.text,
      "fecha_desembolso": formatDate(disbursementDate.text.toString()),
      "fecha_pago": formatDate(payPromiseDate.text.toString()),
      "dias_credito": daysOfCredit.text,
      "comision": commission.text,
      "intereses": interestAmount.text,
      "monto_desembolsar": amountToDisbursed.text,
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
