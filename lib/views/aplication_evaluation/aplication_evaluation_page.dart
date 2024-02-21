import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class ApplicationEvaluationPage extends StatefulWidget {
  const ApplicationEvaluationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationEvaluationPage> createState() =>
      _ApplicationEvaluationPageState();
}

class _ApplicationEvaluationPageState extends State<ApplicationEvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        sideBarList: <SideBarItem>[],
        appBar: CustomAppBarSideBar(
          title: "Evolución de solicitud",
        ),
        child: Column());
  }
}
