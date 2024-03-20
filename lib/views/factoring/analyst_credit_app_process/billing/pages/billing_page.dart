import 'package:developer_company/views/factoring/analyst_credit_app_process/billing/controller/billing_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FactoringBillingPage extends StatefulWidget {
  const FactoringBillingPage({Key? key}) : super(key: key);

  @override
  State<FactoringBillingPage> createState() => _FactoringBillingPageState();
}

class _FactoringBillingPageState extends State<FactoringBillingPage> {
  late FactoringBillingController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FactoringBillingController());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
