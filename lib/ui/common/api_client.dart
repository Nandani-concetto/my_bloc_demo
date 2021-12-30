import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_bloc_demo/di/app_component_base.dart';
import 'app_exception.dart';

///
/// This class contains all URL which is being called to fetch data from server
///
class ApiClient {
  String baseUrl = "http://iguard.concetto-project-progress.com/api/v2/login";
  final String jsonHeaderName = "Content-Type";
  final String jsonHeaderValue = "application/json; charset=UTF-8";
  final int successResponse = 200;

  Map<String, String> getJsonHeader() {
    var header = Map<String, String>();
    header[jsonHeaderName] = jsonHeaderValue;
    return header;
  }

  get(String url, {Map<String, String>? headers}) async {
    if (headers == null) {
      headers = getJsonHeader();
    }
    if (await AppComponentBase.getInstance()
        .getNetworkManager()
        .isConnected()) {
      print(url);
      return await http.get(Uri.parse(url), headers: headers);
    } else {
      throw NoInternetException();
    }
  }

  post(String url,
      {Map<String, String>? headers, dynamic body, Encoding? encoding}) async {
    if (headers == null) {
      headers = getJsonHeader();
    }
    if (await AppComponentBase.getInstance()
        .getNetworkManager()
        .isConnected()) {
      return await http.post(Uri.parse(url),
          headers: headers, body: body, encoding: encoding);
    } else {
      throw NoInternetException();
    }
  }
}
