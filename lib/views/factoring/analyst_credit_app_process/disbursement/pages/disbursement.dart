import 'package:developer_company/views/factoring/analyst_credit_app_process/disbursement/controller/disbrusement_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FactoringDisbursementPage extends StatefulWidget {
  const FactoringDisbursementPage({Key? key}) : super(key: key);

  @override
  State<FactoringDisbursementPage> createState() =>
      _FactoringDisbursementPageState();
}

class _FactoringDisbursementPageState extends State<FactoringDisbursementPage> {
  late FactoringDisbursementController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FactoringDisbursementController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Desembolso pendientes",
      ),
      sideBarList: <SideBarItem>[],
      child: Center(),
    );
  }
}
