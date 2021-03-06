import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supply_demand_covid19/api_request/user_class.dart';

const String main_url = '/api/v1';

const String endpoint_login = '$main_url/auth/login';
const String endpoint_register = '$main_url/auth/register';
const String endpoint_refresh_auth = '$main_url/auth/refresh';

class ApiRequest {
  static Future<DataFromRequest> requestLogin(
      String email, String password) async {
    var response;
    try {
      response = await http.post(
        endpoint_login,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: jsonEncode({"email": email, "password": password}),
      );
    } catch (e) {
      return DataFromRequest(
        message: 'Unknown Error',
        success: false,
        data: null,
      );
    }

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userData = User.fromMap(jsonResponse);
      return DataFromRequest(
        message: 'Login Success',
        success: true,
        data: userData,
      );
    } else {
      return DataFromRequest(
        message: 'Login failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }

  static Future<DataFromRequest> requestRegister(
      String email, String password, String name, String role) async {
    var response;
    try {
      response = await http.post(
        endpoint_register,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
        },
        body: jsonEncode(
            {"email": email, "password": password, 'name': name, 'role': role}),
      );
    } catch (e) {
      return DataFromRequest(
        message: 'Unknown Error',
        success: false,
        data: null,
      );
    }

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var userData = User.fromMap(jsonResponse);
      return DataFromRequest(
        message: 'Register Success',
        success: true,
        data: userData,
      );
    } else {
      return DataFromRequest(
        message: 'Register failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }

  static Future<DataFromRequest> refreshToken(String token) async {
    var response;
    try {
      response = await http.post(
        endpoint_login,
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token',
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
        message: 'Refresh Success',
        success: true,
        data: response.body,
      );
    } else {
      return DataFromRequest(
        message: 'Refresh failed with status: ${response.statusCode}.',
        success: false,
        data: null,
      );
    }
  }
}

class DataFromRequest {
  final String message;
  final bool success;
  final dynamic data;

  DataFromRequest({this.message, this.success, this.data});
}
