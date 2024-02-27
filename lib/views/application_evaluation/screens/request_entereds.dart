import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/views/application_evaluation/controller/application_evaluation_controller.dart';
import 'package:developer_company/widgets/data_table.dart';
import 'package:developer_company/widgets/filter_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestEntered extends StatefulWidget {
  RequestEntered({Key? key}) : super(key: key);

  @override
  _RequestEnteredState createState() => _RequestEnteredState();
}

class _RequestEnteredState extends State<RequestEntered> {
  AppColors appColors = AppColors();
  late Responsive responsive;
  late ApplicationEvaluationController controller;
  final REQUEST_ENTERED = "1";

  fetchData() async {
    // TODO: Implement easy loading
    Map<String, dynamic> args = Get.arguments;
    var fatherId = args['father'];
    controller = Get.put(ApplicationEvaluationController());
    await controller.fetchData(fatherId, REQUEST_ENTERED);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
                                "requestId": element.requestId
                              };
                              final isQuoteUpdate = await Get.toNamed(
                                  RouterPaths.CUSTOMER_ACCEPT_REJECT_REQUEST,
                                  parameters: parameters);

                              if (isQuoteUpdate) {
                                fetchData();
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
