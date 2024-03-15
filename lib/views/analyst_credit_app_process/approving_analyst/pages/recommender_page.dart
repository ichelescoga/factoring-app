import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/analyst_form_credi_appl.dart';
import 'package:developer_company/views/analyst_credit_app_process/approving_analyst/controller/recommender_controller.dart';

class RecommendingAnalystPage extends StatefulWidget {
  const RecommendingAnalystPage({Key? key}) : super(key: key);

  @override
  State<RecommendingAnalystPage> createState() => _RecommendingAnalystPageState();
}

class _RecommendingAnalystPageState extends State<RecommendingAnalystPage> {
  late RecommendingAnalystFormController controller;

  _handleSubmitForm() {}

  @override
  void initState() {
    super.initState();
    controller = Get.put(RecommendingAnalystFormController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      sideBarList: <SideBarItem>[],
      appBar: CustomAppBarSideBar(
        title: "Análisis de créditos",
      ),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AnalystFormCreditApplication(
                controller: controller, doAction: _handleSubmitForm)
          ],
        ),
      )),
    );
  }
}
