import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.106:3333';

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });
    super.onInit();
  }

  Response errorHandler(Response response) {
    // print(response.bodyString);
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        return response;

        // throw 'Ocorreu um erro';
    }
  }
}
