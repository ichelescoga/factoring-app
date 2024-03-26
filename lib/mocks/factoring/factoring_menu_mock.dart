import 'package:developer_company/shared/routes/router_paths.dart';

List<Map<String, dynamic>> factoring_menu = [
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
        "type": "CUSTOM_CARD",
        "entityId": "9",
        "label": "Datos del expediente General",
        "subTitle": "Información del cliente",
        "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/3",
        "editEndpoint": null,
        "addEndpoint": "entity/v1/addEntity",
        "removeEndpoint": null,
        "getByIdEndpoint": null,
        "options": [
          {
            "entityId": "4",
            "label": "Representante legal",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/4",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "3",
            "label": "Oficinas",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/3",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "7",
            "label": "Notificaciones",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/7",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "8",
            "label": "Agente retenedor",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/8",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "5",
            "label": "Cuenta de banco",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/5",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          }
        ]
      },
      {
        "type": "CUSTOM_CARD",
        "entityId": "10",
        "label": "Documentos de cliente",
        "subTitle": "Información de empresa",
        "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/4",
        "editEndpoint": null,
        "addEndpoint": "entity/v1/addEntity",
        "removeEndpoint": null,
        "getByIdEndpoint": null,
        "options": [
          {
            "entityId": "9",
            "label": "Contrato cliente",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/9",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "10",
            "label": "Constitución empresa",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/10",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "11",
            "label": "Documentos representante legal",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/11",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "12",
            "label": "Estados Financieros",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/12",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          },
          {
            "entityId": "13",
            "label": "Proyección de flujo de caja",
            "listEndpoint": "entity/v1/getModsByEntity/CLIENT_ID/13",
            "editEndpoint": null,
            "addEndpoint": "entity/v1/addEntity",
            "removeEndpoint": null,
            "getByIdEndpoint": "entity/v1/getEntityById",
            "viewModeData": true
          }
        ]
      },
      {
        "type": "CUSTOM_PATH",
        "ROUTE": RouterPaths.CREDIT_APPLICATION_FORM_PAGE,
        "entityId":
            "8", //Para recuperar en los argumentos de la pagina en entidad del cliente.
        "label": "Nueva solicitud de crédito",
        "listEndpoint": null,
        "editEndpoint": null,
        "addEndpoint": null,
        "removeEndpoint": null,
        "getByIdEndpoint": null,
      },
      {
        "type": "CUSTOM_PATH",
        "ROUTE": RouterPaths.CUSTOMER_ACCOUNTING_PAGE,
        "entityId":
            "8", //Para recuperar en los argumentos de la pagina en entidad del cliente.
        "label": "Contabilidad",
        "listEndpoint": null,
        "editEndpoint": null,
        "addEndpoint": null,
        "removeEndpoint": null,
        "getByIdEndpoint": null,
      },
    ]
  },
];
