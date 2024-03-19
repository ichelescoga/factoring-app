import 'package:developer_company/controllers/CDI/cdi_check_button_controller.dart';
import 'package:developer_company/data/models/common/image_model.dart';
import 'package:developer_company/shared/constants/cdi/cdi_constants_components.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> retrieveFormControllersInput(
  List<dynamic> formWidgets,
  Map<String, TextEditingController> controllers,
) {
  Map<String, String> values = {};

  formWidgets.forEach((widget) {
    String id = widget["bodyKey"];
    final controller = controllers[id];
    if (widget["Type"] == CDIConstants.input ||
        widget["Type"] == CDIConstants.dropdown ||
        widget["Type"] == CDIConstants.twoCascadeDropdown) {
      if (controller == null)
        throw Exception("Controller doesn't have null. ${id}");
      values[id] = controller.text;
    }
  });

  return values;
}

Map<String, ImageToUpload> retrieveFormControllersImage(
  List<dynamic> formWidgets,
  Map<String, ImageToUpload> controllers,
) {
  Map<String, ImageToUpload> values = {};

  formWidgets.forEach((widget) {
    String id = widget["bodyKey"];
    final controller = controllers[id];

    if (widget["Type"] == CDIConstants.image) {
      if (controller == null)
        throw Exception("Controller doesn't have null. ${id}");
      values[id] = controller;
    }
  });

  return values;
}

Map<String, dynamic> retrieveFormControllersCheckBox(
  List<dynamic> formWidgets,
  Map<String, CDICheckController> controllers,
) {
  Map<String, int> values = {};

  formWidgets.forEach((widget) {
    String id = widget["bodyKey"];
    final controller = controllers[id];
    if (widget["Type"] == CDIConstants.checkButton) {
      if (controller == null)
        throw Exception("Controller doesn't have null. ${id}");
      values[id] = controller.convertValueToInt(controller.isChecked);
    }
  });

  return values;
}

Map<String, dynamic> convertBodyToCdi(
    String entityId, String father, Map<String, dynamic> bodyKeys) {
  Map<String, dynamic> values = {
    "id": entityId,
    "father": father,
    "nombre": bodyKeys["nombre"] == null ? "" : bodyKeys["nombre"],
    "descripcion":
        bodyKeys["descripcion"] == null ? "" : bodyKeys["descripcion"],
    "details": []
  };

  bodyKeys.forEach((key, value) {
    if (key != "nombre" && key != "descripcion") {
      values["details"].add({key: value});
    }
  });

  return values;
}
