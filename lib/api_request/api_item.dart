import 'package:supply_demand_covid19/api_request/endpoint.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supply_demand_covid19/database/barang_helper/barang_helper.dart';

class ApiItem {
  static Future<DataFromRequest> requestGetAllItem(String token) async {
    var response;
    try {
      response = await http.get(
        endpoint_item,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
    } catch (e) {
      return DataFromRequest(
        message: 'Unknown Error',
        success: false,
        data: null,
      );
    }

    if (response.statusCode == 200) {
      List<Map<String, String>> listItem = jsonDecode(response.body);
      return DataFromRequest(
        message: 'Get All Item Success',
        success: true,
        data: listItem,
      );
    } else {
      return DataFromRequest(
        message: 'Get All Item failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }

  static Future<DataFromRequest> requestCreateItem(
      String token, String name) async {
    var response;
    try {
      response = await http.post(
        endpoint_item,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({'name': name}),
      );
    } catch (e) {
      return DataFromRequest(
        message: 'Unknown Error',
        success: false,
        data: null,
      );
    }

    if (response.statusCode == 200) {
      var responseItem = jsonDecode(response.body);
      var item = JenisBarang.fromMap(responseItem);
      return DataFromRequest(
        message: 'Create Item Success',
        success: true,
        data: item,
      );
    } else {
      return DataFromRequest(
        message: 'Create Item failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }

  static Future<DataFromRequest> requestDeleteItem(
      String token, String id) async {
    var response;
    try {
      response = await http.delete(
        '$endpoint_item/$id',
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
    } catch (e) {
      return DataFromRequest(
        message: 'Unknown Error',
        success: false,
        data: null,
      );
    }

    if (response.statusCode == 200) {
      return DataFromRequest(
        message: 'Delete Item Success',
        success: true,
        data: null,
      );
    } else {
      return DataFromRequest(
        message: 'Delete Item failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }
}
