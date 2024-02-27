import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/application_evaluation/controller/application_evaluation_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/data_table.dart';
import 'package:developer_company/widgets/filter_box.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
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
  late ApplicationEvaluationController controller;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> args = Get.arguments;
    var fatherId = args['father'];
    controller = Get.put(ApplicationEvaluationController());
    controller.fetchData(fatherId);
    print(controller);
  }

  AppColors appColors = AppColors();

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
            FilterBox(
                elements: controller.dataFiltered,
                handleFilteredData: (List<ApplicationEvalModel> data) {
                  controller.dataFiltered.clear();
                  controller.dataFiltered.addAll(data);
                  controller.update();
                },
                isLoading: false,
                hint: "Buscar",
                label: "Buscar"),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable<ApplicationEvalModel>(
                columns: const [
                  "Factura",
                  "Serie de factura",
                  "Monto de Facturas",
                  "Porcentaje de utilization",
                  "Monto utilization",
                  "Dias de utilization",
                  "Intereses",
                  ''
                ],
                elements: controller.dataFiltered
                    .asMap()
                    .map((index, element) => MapEntry(
                        index,
                        DataRow(
                          onSelectChanged: (value) async {
                          
                          },
                          cells: [
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.noAuthorization.toString()),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 2.5),
                              child: Text(element.invoiceSerie),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.invoiceAmount),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.utilizationPercentage.toString()),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.usageAmount.toString()),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.daysOfUse.toString()),
                            )),
                            DataCell(Container(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width / 3),
                              child: Text(element.interestAmount),
                            )),
                            DataCell(Container())
                          ],
                          color: appColors.dataRowColors(index),
                        )))
                    .values
                    .toList(),
              ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 24.0),
                width: responsive.wp(60),
                constraints: BoxConstraints(minHeight: responsive.hp(8)),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: AppColors.lightSecondaryColor),
                  color: AppColors.lightColor,
                ),
                child: Center(
                    child: Obx(() => Text(
                        "Política de Créditos${controller.footerLabel.value}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold)))),
              ),
            ),
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
