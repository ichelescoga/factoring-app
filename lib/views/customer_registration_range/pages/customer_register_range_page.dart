import 'package:developer_company/shared/validations/not_empty.dart';
import 'package:developer_company/views/customer_registration_range/controller/customer_register_controller.dart';
import 'package:developer_company/views/customer_registration_range/forms/customer_range_item_form.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/custom_input_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCustomerRangePage extends StatefulWidget {
  const RegisterCustomerRangePage({Key? key}) : super(key: key);

  @override
  State<RegisterCustomerRangePage> createState() =>
      _RegisterCustomerRangePageState();
}

class _RegisterCustomerRangePageState extends State<RegisterCustomerRangePage> {
  late RegisterCustomerRangeController _ctrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(RegisterCustomerRangeController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      sideBarList: [],
      appBar: CustomAppBarSideBar(title: "Alta de cliente"),
      child: Center(
        child: Column(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomInputWidget(
                  controller: _ctrl.client,
                  label: "Cliente",
                  hintText: "Cliente",
                  prefixIcon: Icons.person,
                  validator: (value) => notEmptyFieldValidator(value),
                ),
                CustomInputWidget(
                  controller: _ctrl.amountAssignment,
                  label: "Cupo asignado",
                  hintText: "Cupo asignado",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.number,
                ),
                CustomInputWidget(
                  controller: _ctrl.daysOfCredit,
                  label: "Dias de crédito máximo",
                  hintText: "Dias de crédito máximo",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Obx(() => Column(
                children: List.generate(_ctrl.listRange.length, (index) {
                  final ctrlInstance = _ctrl.listRange.elementAt(index);
                  return CustomerRangeItemForm(controller: ctrlInstance);
                }),
              )),
          CustomButtonWidget(text: "Nuevo rango", onTap: () => _ctrl.addRange())
        ]),
      ),
    );
  }
}
