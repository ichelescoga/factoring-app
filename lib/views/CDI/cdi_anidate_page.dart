import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:developer_company/widgets/CDI/card_with_button_list_widget.dart';
import 'package:developer_company/widgets/app_bar_title.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CDISecondLevel extends StatefulWidget {
  const CDISecondLevel({Key? key}) : super(key: key);

  @override
  _CDISecondLevelState createState() => _CDISecondLevelState();
}

class _CDISecondLevelState extends State<CDISecondLevel> {
  final spaceButton = SizedBox(height: Dimensions.heightSize);
  final defaultPadding = EdgeInsets.only(left: 0, right: 0);
  final Map<String, dynamic> arguments = Get.arguments;

  List<dynamic> mods = [];

  @override
  void initState() {
    mods = arguments["mods"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        sideBarList: [],
        appBar: CustomAppBarTitle(title: arguments["title"]),
        child: Column(
          children: [
            ...mods.map((e) {
              final args = {
                "dataId": e["id"], // in the previous page was defined to id but is dataId
                "entityId": e["entityId"],
                "label": e["label"],
                "listEndpoint": e["listEndpoint"]
                    .toString()
                    .replaceAll("CLIENT_ID", arguments["id"].toString()),
                "editEndpoint": e["editEndpoint"],
                "addEndpoint": e["addEndpoint"],
                "removeEndpoint": e["removeEndpoint"],
                "getByIdEndpoint": e["getByIdEndpoint"],
                "mods": e["mods"] == null ? [] : e["mods"],
                "father": arguments["father"].toString()
              };

              if (e["type"] == "CUSTOM_CARD")
                return CardWithButtonList(
                  title: e["label"],
                  subtitle: e["subTitle"],
                  buttonList: e["options"],
                  routeParams: args,
                );

              if (e["type"] == "CUSTOM_PATH")
                return Column(
                  children: [
                    spaceButton,
                    CustomButtonWidget(
                      text: e["label"]!,
                      onTap: () {
                        Get.toNamed(e["ROUTE"], arguments: args);
                      },
                      padding: defaultPadding,
                    ),
                  ],
                );

              return Column(
                children: [
                  spaceButton,
                  CustomButtonWidget(
                    text: e["label"]!,
                    onTap: () {
                      Get.toNamed(RouterPaths.LIST_CDI_PAGE, arguments: args);
                    },
                    padding: defaultPadding,
                  ),
                ],
              );
            }).toList()
          ],
        ));
  }
}
