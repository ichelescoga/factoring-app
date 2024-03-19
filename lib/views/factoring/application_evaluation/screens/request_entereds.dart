import 'package:developer_company/data/models/factoring/application_evaluation_model.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/strings.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/factoring/application_evaluation/controller/application_evaluation_controller.dart';
import 'package:developer_company/widgets/data_table.dart';
import 'package:developer_company/widgets/filter_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RequestEntered extends StatefulWidget {
  RequestEntered({Key? key, required this.loadAll, required this.mode})
      : super(key: key);

  final bool loadAll;
  final int mode;
  @override
  _RequestEnteredState createState() => _RequestEnteredState();
}

class _RequestEnteredState extends State<RequestEntered> {
  AppColors appColors = AppColors();
  late Responsive responsive;
  late ApplicationEvaluationController controller;
  final REQUEST_ENTERED = "1";

  late String nextPage;

  fetchData() async {
    EasyLoading.show(status: Strings.loading);
    Map<String, dynamic> args = Get.arguments;
    var fatherId = args['father'];
    await controller.fetchData(fatherId, REQUEST_ENTERED);
    EasyLoading.dismiss();
    setState(() {});
  }

  fetchAllData() async {
    EasyLoading.show(status: Strings.loading);
    await controller.fetchAll(REQUEST_ENTERED);
    EasyLoading.dismiss();
    setState(() {});
  }

  fetch() {
    if (widget.loadAll) {
      fetchAllData();
    } else {
      fetchData();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = Get.put(ApplicationEvaluationController());
    switch (widget.mode) {
      case 1:
        {
          nextPage = RouterPaths.ANALYST_RECOMMENDING_PAGE;
          break;
        }
      case 2:
        {
          nextPage = RouterPaths.ANALYST_APPROVING_PAGE;
        }
    }
    fetch();
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
              setState(() {});
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
                          DataCell(IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              // controller.getApplicationRequest(element);

                              Map<String, String> parameters = {
                                "idRequest": "0",
                                "authorization":
                                    element.noAuthorization.toString(),
                                "invoiceSerie": element.invoiceSerie,
                                "invoiceAmount": element.invoiceAmount,
                                "requestId": element.requestId,
                                "mode": widget.mode.toString(),
                              };
                              final isQuoteUpdate = await Get.toNamed(nextPage,
                                  parameters: parameters);

                              if (isQuoteUpdate) {
                                fetch();
                              }
                            },
                          ))
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
