const String main_url = '/api/v1';

const String endpoint_login = '$main_url/auth/login';
const String endpoint_register = '$main_url/auth/register';
const String endpoint_refresh_auth = '$main_url/auth/refresh';

const String endpoint_item = '$main_url/items';

class DataFromRequest {
  final String message;
  final bool success;
  final dynamic data;

  DataFromRequest({this.message, this.success, this.data});
}
