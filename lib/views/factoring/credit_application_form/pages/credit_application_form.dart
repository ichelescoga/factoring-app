import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/views/factoring/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:developer_company/views/factoring/credit_application_form/forms/form_credit_application.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CreditApplicationFormPage extends StatefulWidget {
  const CreditApplicationFormPage({Key? key}) : super(key: key);

  @override
  State<CreditApplicationFormPage> createState() =>
      _CreditApplicationFormPageState();
}

class _CreditApplicationFormPageState extends State<CreditApplicationFormPage> {
  late CreditApplicationFormController _controller;
  final _formKey = GlobalKey<FormState>();

  _handleSubmitForm() {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: Strings.loading);
      _controller.sedCreditRequest(getBack);
    }
  }

  void getBack() {
    EasyLoading.dismiss();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> args = Get.arguments;
    var fatherId = args['father'];
    _controller = Get.put(CreditApplicationFormController());
    _controller.setFatherId(fatherId);
    _controller.getEntityById();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      sideBarList: <SideBarItem>[],
      appBar: CustomAppBarSideBar(
        title: "Solicitud de crédito",
      ),
      child: Center(
          child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: FormCreditApplication(
              ctrl: _controller,
              doAction: _handleSubmitForm,
            )),
      )),
    );
  }
}
