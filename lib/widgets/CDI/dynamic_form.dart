import "package:developer_company/controllers/cdi_check_button_controller.dart";
import "package:developer_company/data/models/image_model.dart";
import 'package:developer_company/controllers/manage_company_page_controller.dart';
import "package:developer_company/shared/utils/http_adapter.dart";
import "package:developer_company/utils/cdi_components.dart";
import "package:developer_company/utils/cdi_functions.dart";
import "package:developer_company/widgets/CDI/cdi_inputs_widgets.dart";
import "package:developer_company/widgets/autocomplete_dropdown.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class DynamicDatabaseForm extends StatefulWidget {
  final bool isEnable;
  final String? id;
  final Map<String, TextEditingController> controllers;
  final Map<String, ImageToUpload> imageControllers;
  final Map<String, CDICheckController> checkControllers;
  final List<dynamic> formCustomWidgets;
  final Future<dynamic> Function(dynamic) callBackById;

  const DynamicDatabaseForm({
    Key? key,
    required this.isEnable,
    required this.controllers,
    required this.formCustomWidgets,
    required this.imageControllers,
    required this.checkControllers,
    required this.callBackById,
    this.id,
  }) : super(key: key);

  @override
  State<DynamicDatabaseForm> createState() => _DynamicDatabaseFormState();
}

class _DynamicDatabaseFormState extends State<DynamicDatabaseForm> {
  bool isEnable = false;
  CreateCompanyPageController createCompanyPageController =
      Get.put(CreateCompanyPageController());

  HttpAdapter http = HttpAdapter();

  List<dynamic> formWidgets = [];
  dynamic company = {};
  List<DropDownOption> dropdownElements = [];

  _processCompanyForm() async {
    String? companyId = widget.id == null ? null : widget.id.toString();
    List<dynamic> fields = widget.formCustomWidgets;

    final result = await processDataForm(
        fields, companyId, (data) => widget.callBackById(widget.id!));
    setState(() {
      formWidgets = result;
    });
  }

  @override
  void initState() {
    super.initState();
    isEnable = widget.isEnable;
    _processCompanyForm();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: formWidgets.map((widgetEP) {
        String id = widgetEP["bodyKey"];

        if (widgetEP["show"] == false || widgetEP["show"] == 0) {
          return buildNoShowWidget(widgetEP, id, widget.controllers);
        }

        if (widgetEP["Type"] == CDIConstants.dropdown) {
          return buildDropdownWidget(
              widgetEP, id, widget.controllers, isEnable);
        }
        if (widgetEP["Type"] == CDIConstants.image) {
          return buildImageWidget(
              widgetEP, id, widget.imageControllers, isEnable);
        }
        if (widgetEP["Type"] == CDIConstants.input) {
          return buildInputWidget(widgetEP, id, widget.controllers, isEnable);
        }
        if (widgetEP["Type"] == CDIConstants.twoCascadeDropdown &&
            widgetEP["listKeys"].toString().contains("father")) {
          return buildTwoDropDownCascade(
              widgetEP, id, widget.controllers, formWidgets, isEnable);
        }
        if (widgetEP["Type"] == CDIConstants.checkButton) {
          return buildCheckBox(widgetEP, id, widget.checkControllers, isEnable);
        }

        return Container();
      }).toList(),
    );
  }
}
