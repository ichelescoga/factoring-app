import 'package:developer_company/data/models/factoring/application_evaluation_model.dart';
import 'package:developer_company/shared/constants/factoring/request_status.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/factoring/application_evaluation/controller/application_evaluation_controller.dart';
import 'package:developer_company/widgets/data_table.dart';
import 'package:developer_company/widgets/filter_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RequestDenied extends StatefulWidget {
  RequestDenied({Key? key, required this.loadAll, required this.mode})
      : super(key: key);

  final bool loadAll;
  final int mode;
  @override
  _RequestDeniedState createState() => _RequestDeniedState();
}

class _RequestDeniedState extends State<RequestDenied> {
  AppColors appColors = AppColors();
  late Responsive responsive;
  late ApplicationEvaluationController controller;

  fetchData() async {
    EasyLoading.show(status: Strings.loading);
    // TODO: Implement easy loading
    Map<String, dynamic> args = Get.arguments;
    var fatherId = args['father'];
    await controller.fetchData(fatherId, FacRequestStatus.DENIED);
    EasyLoading.dismiss();
    setState(() {});
  }

  fetchAllData() async {
    EasyLoading.show(status: Strings.loading);
    await controller.fetchAll(widget.mode);
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(ApplicationEvaluationController());
    if (widget.loadAll) {
      fetchAllData();
    } else {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Cliente",
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
                        onSelectChanged: (value) async {},
                        cells: [
                          DataCell(Container(
                            constraints:
                                BoxConstraints(maxWidth: Get.width / 3),
                            child: Text(element.name),
                          )),
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
                            child:
                                Text(element.utilizationPercentage.toString()),
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
      ],
    );
  }
}
