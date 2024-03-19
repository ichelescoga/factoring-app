import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/views/cash-advance/customer_registration_range/controller/customer_register_controller.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomerRangeItemForm extends StatelessWidget {
  const CustomerRangeItemForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CustomerRangeController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          const Divider(
            height: 20,
            thickness: 5,
            indent: 0,
            endIndent: 0,
            color: AppColors.mainColor,
          ),
          CustomInputWidget(
            controller: controller.name,
            label: "Rango nombre",
            hintText: "R. Nombre",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          CustomInputWidget(
            controller: controller.maxAmount,
            label: "Máximo",
            hintText: "Máximo",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          CustomInputWidget(
            controller: controller.minTime,
            label: "Tiempo mínimo",
            hintText: "Tiempo mínimo",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          CustomInputWidget(
            controller: controller.maxTime,
            label: "Tiempo máximo",
            hintText: "Tiempo máximo",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          CustomInputWidget(
            controller: controller.employedClass,
            label: "Empleado",
            hintText: "Empleado",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
          CustomInputWidget(
            controller: controller.commissionRate,
            label: "Tasa commission",
            hintText: "Tasa commission",
            prefixIcon: Icons.person,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
