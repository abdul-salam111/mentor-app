import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mentor_app/app/data/app_exceptions.dart';
import 'package:mentor_app/app/data/network/baseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getResponse(String url) async {
    dynamic responsejson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 100));
      responsejson = returnResponse(response);
  
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }
    return responsejson;
  }

  @override
  Future getPostResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      http.Response response =
          await http.post(Uri.parse(url), body: data, headers: {
        "Content-Type": "application/json",
      }).timeout(const Duration(seconds: 100));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions("No Internet Connection");
    }

    return responsejson;
  }

  dynamic returnResponse(http.Response response) {

print(response.statusCode);
print(response.body);
    switch (response.statusCode) {
   
      
      case 200:
        dynamic jsonresponse = jsonDecode(response.body);
        return jsonresponse;
      case 415:
      dynamic jsonresponse=jsonDecode(response.body);
      return jsonresponse;
      case 400:
        throw BadRequestExceptions("Invalid email or password");
      case 404:
        throw UnAuthorizeExceptions("Invalid email or password");
      default:
        throw FetchDataExceptions(
            "Error occurred while communicating server with status code ${response.statusCode}");
    }
  }
}
