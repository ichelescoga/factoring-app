import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/filter_box.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/data/models/factoring/factoraje_accounting_model.dart';
import 'package:developer_company/views/factoring/factoraje_accounting/controller/accounting_controller.dart';

class AccountingFactoragePage extends StatefulWidget {
  const AccountingFactoragePage({Key? key}) : super(key: key);

  @override
  State<AccountingFactoragePage> createState() =>
      _AccountingFactoragePageState();
}

class _AccountingFactoragePageState extends State<AccountingFactoragePage> {
  late AccountingFactorageController controller;
  late Responsive responsive;

  @override
  void initState() {
    super.initState();
    var args = Get.arguments;
    var id = args['father'];
    controller = Get.put(AccountingFactorageController());
    controller.setFatherId(id);
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive.of(context);
    return Layout(
      appBar: CustomAppBarSideBar(
        title: "Contabilidad desembolso",
      ),
      sideBarList: [],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterBox(
              elements: controller.data,
              handleFilteredData: (List<AccountingModel> data) {
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
                    columnLabel("Aprobación"),
                    columnLabel("Desembolso"),
                  ],
                  rows: List<DataRow>.generate(controller.data.length, (index) {
                    final item = controller.data.elementAt(index);
                    print(index);
                    return DataRow(
                        color: index % 2 == 0
                            ? MaterialStateProperty.all<Color>(
                                AppColors.lightColor)
                            : MaterialStateProperty.all<Color>(
                                AppColors.lightSecondaryColor),
                        cells: item
                            .toMap()
                            .values
                            .map((e) => cellItem(e))
                            .toList());
                  }))),
            ),
          ),
        ],
      ),
    );
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
