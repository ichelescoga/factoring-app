import 'dart:convert';
import 'package:developer_company/data/models/EmployedCreditRequest.dart';
import 'package:developer_company/shared/utils/http_adapter.dart';

class CashAdvanceProvider {
  final HttpAdapter _httpAdapter = HttpAdapter();

  Future<List<EmployedCreditRequest>> getApplicationRequest(int status, int  id) async {
    final response = await _httpAdapter
        .getApi("solicituda/v1/getSolicitudesByEstado/$status/$id", {});
    if (response.statusCode == 200) {
      Iterable result = json.decode(response.body);
      var data = result.map((e) => EmployedCreditRequest.fromJson(e)).toList();
      return data;
    } else {
      throw Exception("Failed to get status of application requests");
    }
  }

  Future<bool> postApplicationRequest(Map<String, dynamic> data) async {
    try {
      final body = jsonEncode(data);
      final response = await _httpAdapter.postApi(
        "solicituda/v1/addSolicitud",
        body,
        {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      print('Error POST solicitud: $e');
    }

    return false;
  }

  Future<Map> getUserInformation(String idFather) async {
    final response =
        // await _httpAdapter.getApi("entitya/v1/getEntityById/$idFather", {});
        await _httpAdapter
            .getApi("solicituda/v1/getEmpleadoById/$idFather", {});
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      Map<String, dynamic> data = {
        "empleado_nombre": result[0]['Nombre'],
        "empleado_codigo": result[1]['Valor'],
        "empleado_rangoId": result[2]['Valor'],
      };
      return {"data": data, "success": true};
    }
    return {"success": false};
  }

  Future<Map> getUserRango(int idRange) async {
    final response =
        await _httpAdapter.getApi("solicituda/v1/getRangoById/$idRange", {});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return {"data": data, "success": true};
    }
    return {"success": false};
  }
}
