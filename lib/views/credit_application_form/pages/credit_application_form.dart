import 'package:developer_company/views/credit_application_form/controller/credit_application_form_controller.dart';
import 'package:developer_company/views/credit_application_form/forms/form_credit_application.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreditApplicationFormPage extends StatefulWidget {
  const CreditApplicationFormPage({Key? key}) : super(key: key);

  @override
  State<CreditApplicationFormPage> createState() =>
      _CreditApplicationFormPageState();
}

class _CreditApplicationFormPageState extends State<CreditApplicationFormPage> {
  late CreditApplicationFormController _ctrl;
  final _formKey = GlobalKey<FormState>();

  _handleSubmitForm() {
    print("validate");
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(CreditApplicationFormController());
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
              ctrl: _ctrl,
              doAction: _handleSubmitForm,
            )),
      )),
    );
  }
}
