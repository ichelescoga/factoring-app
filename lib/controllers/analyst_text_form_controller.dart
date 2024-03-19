import 'package:flutter/widgets.dart';
import 'package:developer_company/data/models/common/image_model.dart';
import 'package:developer_company/shared/controllers/base_controller.dart';

class AnalystTextFormController extends BaseController {
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

  ImageToUpload filename = ImageToUpload(
    base64: null,
    needUpdate: true,
    link: "",
  );
}
