import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart';

import '../injector.dart';
import 'api_constants.dart';
import 'unathorised_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final Client _client;

  ApiClient(this._client);


  dynamic get(String path, {Map<dynamic, dynamic>? params, bool isReport = false}) async {

    _apiLogs(
      requestMethod: 'GET',
      api: await _getPath(path, params, isReport: isReport),
      headers: await _headers(),
    );

    final response = await _client.get(
      await _getPath(path, params, isReport: isReport),
      headers: await _headers(),
    ); //.timeout(const Duration(seconds: 30));

    _apiLogs(
        requestMethod: 'GET',
        api: await _getPath(path, params, isReport: isReport),
        headers: await _headers(),
        statusCode: response.statusCode,
        response: response.body
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if(response.statusCode == 504) {
      throw TimeoutException(response.reasonPhrase);
    }else if(response.statusCode == 403){
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Uri> _getPath(String path, Map<dynamic, dynamic>? params, {bool isReport = false}) async{

    var paramsString = '';

    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.kBaseUrl}$path${paramsString.isNotEmpty ? "?$paramsString" : ""}');
  }

  Future<Map<String, String>> _headers() async{

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  void _apiLogs({String? requestMethod, Uri? api, Map<String, String>? headers, body, int? statusCode, String? response}) {
    if(requestMethod != null) {
      log('METHOD $requestMethod: ${api.toString()}');
    }
    if(headers != null) {
      log('HEADERS: $headers');
    }

    if(body != null)  {
      log('REQUEST_BODY: $body');
    }

    if(statusCode != null) {
      log('STATUS CODE: $statusCode');
    }

    if(response != null) {
      log('RESPONSE: $response');
    }
  }
}
