import 'dart:convert';
import 'dart:math';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_getx/Api/ApiResponse.dart';

class ApiService {
  final box = GetStorage();

  Future<ApiResponse> post(String url, { Map<String, String>? data}) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json', 'token': box.read('token')??''},
    );
    print(response.body);

    return _handleResponse(response);
  }
  Future<ApiResponse> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'token': box.read('token')??''},
    );
    return _handleResponse(response);

  }

  Future<ApiResponse> _handleResponse(http.Response response) async {
    final decodedBody = json.decode(response.body??'');
    if (response.statusCode >= 200 && decodedBody['status']=='success'){
      return ApiResponse(
        isSuccess: true,
        jsonResponse: decodedBody,
        statusCode: 200,
      );
    }else if (response.statusCode == 401) {
      return ApiResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        jsonResponse: decodedBody,
      );
    } else {
      return ApiResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        jsonResponse: decodedBody,
      );
    }
  }
}
