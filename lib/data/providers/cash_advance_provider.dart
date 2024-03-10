import 'dart:convert';
import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/shared/utils/http_adapter.dart';

class CashAdvanceProvider {
  final HttpAdapter _httpAdapter = HttpAdapter();

  Future<List<ApplicationEvalModel>> getApplicationRequest(String id) async {
    final response = await _httpAdapter
        .getApi("solicituda/v1/getSolicitudesByEstado/1/$id", {});
    if (response.statusCode == 200) {
      Iterable result = json.decode(response.body);
      var data = result.map((e) => ApplicationEvalModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception("Failed to get status of application requests");
    }
  }

  Future<bool> postApplicationRequest(Map body) async {
    final response =
        await _httpAdapter.postApi("solicituda/v1/addSolicitud", body, {});
    print(response);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<Map> getUserInformation(String idFather) async {
    final response =
        await _httpAdapter.getApi("entitya/v1/getEntityById/$idFather", {});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return {"data": data, "success": true};
    }
    return {"success": false};
  }

  Future<Map> getUserRango(String idFather) async {
    final response =
        await _httpAdapter.getApi("solicituda/v1/getRangosByEntity/$idFather", {});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return {"data": data[0], "success": true};
    }
    return {"success": false};
  }
}
