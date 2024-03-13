import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/application_evaluation/screens/request_approveds.dart';
import 'package:developer_company/views/application_evaluation/screens/request_denieds.dart';
import 'package:developer_company/views/application_evaluation/screens/request_entereds.dart';
import 'package:developer_company/views/quotes/pages/quote_unit_status_page.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:developer_company/widgets/top_selector_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationEvaluationPage extends StatefulWidget {
  const ApplicationEvaluationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationEvaluationPage> createState() =>
      _ApplicationEvaluationPageState();
}

class _ApplicationEvaluationPageState extends State<ApplicationEvaluationPage> {
  late Responsive responsive;

  bool loadAllData = false;

  List<Item> options = [
    Item(
        id: "entered",
        icon: Icons.plus_one,
        title: 'Ingresadas',
        isSelected: true),
    Item(
        id: "approved",
        icon: Icons.check,
        title: 'Aprobados',
        isSelected: false),
    Item(
        id: "rejected",
        icon: Icons.cancel,
        title: 'Rechazadas',
        isSelected: false),
  ];

  late Item itemSelected;
  @override
  void initState() {
    super.initState();
    // fetchRequestedDiscounts();
    var args = Get.arguments;
    var condition = args['loadAll'];
    if (condition != null && condition) {
      loadAllData = true;
    }
    itemSelected = options.first;
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
        sideBarList: <SideBarItem>[],
        appBar: CustomAppBarSideBar(
          title: "Evaluación de solicitud",
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSelectorScreen(
                items: options,
                onTapOption: (p0) {
                  setState(() {
                    itemSelected = p0;
                  });
                }),
            SizedBox(height: 10),
            if (itemSelected.id == "entered")  RequestEntered(loadAll: loadAllData),
            if (itemSelected.id == "approved") RequestApproved(loadAll: loadAllData,),
            if (itemSelected.id == "rejected") RequestDenied(loadAll: loadAllData,),
          ],
        ));
  }

  DataCell cellItem(String data) {
    return DataCell(Container(
      constraints: BoxConstraints(maxWidth: Get.width / 3),
      child: Text(data),
    ));
  }

  DataColumn columnLabel(String label) {
    return DataColumn(
      label: Expanded(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
