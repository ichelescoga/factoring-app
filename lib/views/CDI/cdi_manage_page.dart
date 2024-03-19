import 'package:developer_company/controllers/cdi_check_button_controller.dart';
import 'package:developer_company/data/implementations/CDI/cdi_repository_impl.dart';
import 'package:developer_company/data/models/common/image_model.dart';
import 'package:developer_company/data/providers/CDI/cdi_provider.dart';
import 'package:developer_company/data/repositories/CDI/cdi_repository.dart';
import 'package:developer_company/shared/resources/colors.dart';
import 'package:developer_company/shared/resources/dimensions.dart';
import 'package:developer_company/utils/common/handle_upload_image.dart';
import 'package:developer_company/utils/common/retrieve_form_list_controllers.dart';
import 'package:developer_company/widgets/CDI/dynamic_form.dart';
import 'package:developer_company/widgets/app_bar_title.dart';
import 'package:developer_company/widgets/custom_button_widget.dart';
import 'package:developer_company/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CDIManagePage extends StatefulWidget {
  const CDIManagePage({Key? key}) : super(key: key);

  @override
  _CDIManagePageState createState() => _CDIManagePageState();
}

class _CDIManagePageState extends State<CDIManagePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> manageCDIFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> arguments = Get.arguments;
  Map<String, TextEditingController> formControllers = {};
  Map<String, ImageToUpload> imageControllers = {};
  Map<String, CDICheckController> checkControllers = {};
  CDIRepository cdiRepository = CDIRepositoryImpl(CDIProvider());
  List<dynamic> formWidgets = [];
  String entityId = "";
  String editEndpoint = "";
  String addEndpoint = "";
  String principalLabel = "";
  String getByIdEndpoint = "";
  String father = "";
  String? dataId;
  int activeStep = 0;
  double circleRadius = 20;
  bool viewModeData = false;

  _getFormCDI() async {
    final result = await cdiRepository.fetchDataTable(entityId);
    setState(() {
      formWidgets = result;
    });
  }

  _getImportantDataToCDI() async {
    entityId = arguments["entityId"].toString();
    editEndpoint = arguments["editEndpoint"].toString();
    addEndpoint = arguments["addEndpoint"];
    principalLabel = arguments["principalLabel"];
    getByIdEndpoint = arguments["getByIdEndpoint"].toString();
    viewModeData =
        arguments["viewModeData"] != null ? arguments["viewModeData"] : false;
    father = arguments["father"];
  }

  _handleSaveFormData(
      Map<String, dynamic> inputValues,
      Map<String, ImageToUpload> imageValues,
      Map<String, dynamic>
          dropdownValues, //TODO: should be receive the dynamicInputDropDownValues;
      Map<String, dynamic> checkControllers) async {
    EasyLoading.show();
    final imagesResponse = await handleImagesToUpload(imageValues);
    bool result = false;

    // final tempConsult =
    //     await cdiRepository.getDataById(getByIdEndpoint, dataId.toString());

    final body = convertBodyToCdi(entityId, father,
        {...inputValues, ...imagesResponse, ...checkControllers});

    if (dataId != null) {
      result =
          await cdiRepository.postData(editEndpoint, {"id": dataId, ...body});
    } else {
      result = await cdiRepository.postData(addEndpoint, {...body});
    }
    if (result) {
      Get.back(closeOverlays: true, result: result);
    }

    EasyLoading.dismiss();
  }

  @override
  void initState() {
    super.initState();
    _getImportantDataToCDI();
    _getFormCDI();
    if (arguments["dataId"] != null) {
      dataId = arguments["dataId"].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        sideBarList: [],
        appBar: CustomAppBarTitle(
          title: "Gestión de ${principalLabel}",
        ),
        child: Form(
          key: manageCDIFormKey,
          child: Column(
            children: [
              if (!formWidgets.length.isEqual(0))
                DynamicDatabaseForm(
                    callBackById: (p0) => cdiRepository.getDataById(
                        getByIdEndpoint, dataId.toString()),
                    imageControllers: imageControllers,
                    checkControllers: checkControllers,
                    controllers: formControllers,
                    isEnable: !viewModeData,
                    id: dataId,
                    formCustomWidgets: formWidgets),
              const SizedBox(
                height: Dimensions.heightSize,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                        padding: EdgeInsets.zero,
                        text: "Atrás",
                        onTap: () => Navigator.pop(context, false)),
                  ),
                  const SizedBox(width: Dimensions.formSpaceBetweenButtons),
                  if (!viewModeData)
                    Expanded(
                        child: CustomButtonWidget(
                      padding: EdgeInsets.zero,
                      color: AppColors.blueColor,
                      text: "Guardar",
                      onTap: () {
                        if (manageCDIFormKey.currentState!.validate()) {
                          final inputValues = retrieveFormControllersInput(
                              formWidgets, formControllers);
                          final imageValues = retrieveFormControllersImage(
                              formWidgets, imageControllers);
                          final checkButtonsValues =
                              retrieveFormControllersCheckBox(
                                  formWidgets, checkControllers);
                          _handleSaveFormData(
                              inputValues, imageValues, {}, checkButtonsValues);
                        } else {
                          EasyLoading.showInfo(
                              "Por favor verifique que los campos sean validos.");
                        }
                      },
                    )),
                ],
              ),
              const SizedBox(
                height: Dimensions.heightSize,
              ),
            ],
          ),
        ));
  }
}
