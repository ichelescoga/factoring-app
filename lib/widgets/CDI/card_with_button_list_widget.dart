import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/routes/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWithButtonList extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Map<String, dynamic>> buttonList;
  final Map<String, dynamic> routeParams;

  CardWithButtonList(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.buttonList,
      required this.routeParams})
      : super(key: key);

  @override
  _CardWithButtonListState createState() => _CardWithButtonListState();
}

class _CardWithButtonListState extends State<CardWithButtonList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  handleManageData(element) async {
    Get.toNamed(RouterPaths.MANAGE_CDI_PAGE, arguments: {
      "dataId": null,
      "entityId": element["entityId"],
      "editEndpoint": element["editEndpoint"],
      "addEndpoint": element["addEndpoint"],
      "principalLabel": element["label"],
      "getByIdEndpoint": element["getByIdEndpoint"],
      "father": widget.routeParams["father"]
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.isDismissed ? _controller.forward() : _controller.reverse();
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.subtitle),
            ),
            SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                width: double.infinity,
                child: Column(
                  children: widget.buttonList
                      .map((element) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (element["listEndpoint"] != null) {
                                  Get.toNamed(RouterPaths.LIST_CDI_PAGE,
                                      arguments: ({
                                        ...element,
                                        "id": widget.routeParams["id"],
                                        "father": widget.routeParams["father"],
                                        "listEndpoint": element["listEndpoint"]
                                            .toString()
                                            .replaceAll(
                                              "CLIENT_ID",
                                              widget.routeParams["father"]
                                                  .toString(),
                                            )
                                      }));
                                } else {
                                  print("values ${element}");
                                  handleManageData(element);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.softMainColor,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(element["label"]),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
