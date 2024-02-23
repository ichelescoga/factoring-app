import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:developer_company/shared/utils/permission_level.dart';
import 'package:developer_company/widgets/AuthorizationWrapper.dart';
// import 'package:developer_company/shared/utils/responsive.dart';
import 'package:developer_company/widgets/app_bar_sidebar.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:developer_company/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<SideBarItem> sideBarList = [
    SideBarItem(
      requestAction: PermissionLevel.sideBarMarketing,
      id: "marketing",
      icon: Icons.insert_emoticon_sharp,
      title: 'Material Audio Visual',
      route: RouterPaths.MARKETING_CARROUSEL_ALBUMS,
    ),
    SideBarItem(
      requestAction: PermissionLevel.sideBarContacts,
      id: "contacts",
      icon: Icons.contacts,
      title: 'Contactos',
      route: RouterPaths.QUICK_CONTACT_LIST_PAGE,
    )
  ];

  final List<String> overviews = [
    "Semana actual",
    "Semana pasada",
    "Mes pasado",
  ];

  final List<String> overviewText = [
    "Rendimiento esta semana",
    "Rendimiento semana pasada",
    "Rendimiento Mes pasado",
  ];

  final List<double> overviewPercentage = [64, 40, 90];

  final List<Color> overviewColors = [
    AppColors.mainColor,
    AppColors.greyColor,
    AppColors.softMainColor
  ];

  final indexTab = 0.obs;
  final showFirst = false.obs;

  final spaceButton = SizedBox(height: Dimensions.heightSize);
  final defaultPadding = EdgeInsets.only(left: 0, right: 0);

  // "value1": "Expediente", //9
  // "value2": "Representante Legal", // 10
  //  "value3": "Cuenta Banco", //11

  final List<Map<String, dynamic>> cdi = [
    {
      "entityId": "8",
      "label": "Cliente",
      "listEndpoint": "entity/v1/getEntities/8",
      "editEndpoint": null,
      "addEndpoint": "entity/v1/addEntity",
      "removeEndpoint": null,
      "getByIdEndpoint": null,
      "mods": [
        {
          "entityId": "9",
          "label": "Expediente",
          "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/3",
          "editEndpoint": null,
          "addEndpoint": "entity/v1/addEntity",
          "removeEndpoint": null,
          "getByIdEndpoint": null,
        },
        {
          "entityId": "10",
          "label": "Representa Legal",
          "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/4",
          "editEndpoint": null,
          "addEndpoint": "entity/v1/addEntity",
          "removeEndpoint": null,
          "getByIdEndpoint": null,
        },
        {
          "entityId": "11",
          "label": "Cuentas de bancos",
          "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/5",
          "editEndpoint": null,
          "addEndpoint": "entity/v1/addEntity",
          "removeEndpoint": null,
          "getByIdEndpoint": null,
        },
      ]
    },
  ];

  Future askPermission() async {
    await Permission.manageExternalStorage.request();
    var status = await Permission.manageExternalStorage.status;
    if (status.isDenied) {
      return;
    }
    if (await Permission.storage.isRestricted) {
      return;
    }
    if (status.isGranted) {}
  }

  @override
  void initState() {
    super.initState();
    askPermission();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive responsive = Responsive.of(context);
    return Layout(
      onBackFunction: () {
        Get.overlayContext?.findRootAncestorStateOfType<NavigatorState>();
      },
      sideBarList: sideBarList,
      appBar: CustomAppBarSideBar(title: "Aplicación"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...cdi
              .map((e) => Column(
                    children: [
                      spaceButton,
                      CustomButtonWidget(
                          text: e["label"].toString(),
                          onTap: () => Get.toNamed(RouterPaths.LIST_CDI_PAGE,
                                  arguments: {
                                    "entityId": e["entityId"],
                                    "label": e["label"],
                                    "listEndpoint": e["listEndpoint"],
                                    "editEndpoint": e["editEndpoint"],
                                    "addEndpoint": e["addEndpoint"],
                                    "removeEndpoint": e["removeEndpoint"],
                                    "getByIdEndpoint": e["getByIdEndpoint"],
                                    "mods": e["mods"]
                                  }),
                          padding: defaultPadding),
                    ],
                  ))
              .toList(),
          // authItem(
          //     PermissionLevel.discountsByQuote,
          //     "Descuentos",
          //     () => Get.toNamed(RouterPaths.DISCOUNTS_BY_QUOTE_PAGE,
          //         arguments: {"isWatchMode": false})),
          // authItem(
          //     PermissionLevel.applicationEvaluation,
          //     "Solicitudes",
          //     () => Get.toNamed(RouterPaths.APPLICATION_EVALUATION_PAGE,
          //         arguments: {"isWatchMode": false})),
          authItem(
              PermissionLevel.applicationEvaluation,
              "Solicitud de crédito",
              () => Get.toNamed(RouterPaths.CREDIT_APPLICATION_FORM_PAGE,
                  arguments: {"isWatchMode": false})),
          authItem(
              PermissionLevel.applicationEvaluation,
              "Contabilidad",
              () => Get.toNamed(RouterPaths.CUSTOMER_ACCOUNTING_PAGE,
                  arguments: {"isWatchMode": false})),
        ],
      ),
    );
  }

  authItem(String requestAction, String label, void Function() doAction) {
    return AuthorizationWrapper(
      requestAction: requestAction,
      child: Column(
        children: [
          spaceButton,
          CustomButtonWidget(
              text: label, onTap: doAction, padding: defaultPadding),
        ],
      ),
    );
  }
}
