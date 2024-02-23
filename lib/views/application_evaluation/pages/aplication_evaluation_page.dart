import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/application_evaluation/controller/application_evaluation_controller.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
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
    controller = Get.put(ApplicationEvaluationController());
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
        sideBarList: <SideBarItem>[],
        appBar: CustomAppBarSideBar(
          title: "Evolución de solicitud",
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterBox(
                elements: controller.data,
                handleFilteredData: (List<ApplicationEvalModel> data) {
                  setState(() => controller.dataFiltered.assignAll(data));
                },
                isLoading: false,
                hint: "Buscar",
                label: "Buscar"),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => DataTable(
                    showCheckboxColumn: false,
                    headingRowHeight: responsive.hp(6),
                    headingRowColor: MaterialStateProperty.all<Color>(
                        AppColors.secondaryMainColor),
                    columns: <DataColumn>[
                      columnLabel("No. Autorización"),
                      columnLabel("Cliente"),
                      columnLabel("Monto de Facturas"),
                      columnLabel("Porcentaje de utilization"),
                      columnLabel("Monto utilization"),
                      columnLabel("Dias de utilization"),
                      columnLabel("Intereses"),
                      columnLabel("Commission"),
                      columnLabel("IVA"),
                      columnLabel("Total descuento"),
                      columnLabel("Desembolso"),
                      columnLabel("Fecha de Desembolso"),
                      columnLabel("Fecha de pago"),
                      columnLabel("Cupo disponible"),
                      columnLabel("Saldo en mora"),
                      columnLabel("Análisis"),
                      columnLabel("Aprobar/Denegar")
                    ],
                    rows:
                        List<DataRow>.generate(controller.data.length, (index) {
                      final item = controller.data.elementAt(index);
                      print(index);
                      return DataRow(
                          color: index % 2 == 0
                              ? MaterialStateProperty.all<Color>(
                                  AppColors.lightColor)
                              : MaterialStateProperty.all<Color>(
                                  AppColors.lightSecondaryColor),
                          cells: [
                            ...item
                                .toMap()
                                .values
                                .map((e) => cellItem(e))
                                .toList(),
                            DataCell(Center(
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.thumbs_up_down)),
                            ))
                          ]);
                    }))),
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
