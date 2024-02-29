import 'dart:convert';
import 'package:developer_company/data/models/application_evaluation_model.dart';
import 'package:developer_company/shared/utils/http_adapter.dart';

class FactoringProvider {
  final HttpAdapter _httpAdapter = HttpAdapter();

  Future<List<ApplicationEvalModel>> getApplicationRequest(
      String id, String state) async {
    final response = await _httpAdapter
        .getApi("solicitud/v1/getSolicitudesByEstado/${state}/$id", {});
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
        await _httpAdapter.postApi("solicitud/v1/addSolicitud", body, {});
    print(response);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<Map> getEntityById(int id) async {
    final response = await _httpAdapter.getApi("entity/v1/getEntityById/${id}", {});

    if (response.statusCode == 200) {
      Map body = jsonDecode(response.body);
      return {"data": body, "success": true};
    }
    return {"data": null, "success:": false};
  }
}
