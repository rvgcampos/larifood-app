import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/env.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class Api extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'http://192.168.1.133:3333';
    httpClient.baseUrl = Get.find<Env>().host;
    // httpClient.baseUrl = 'http://192.168.24.235:3333';

    final box = GetStorage();
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] =
          'Bearer ${(box.read('token')).toString()}';

      return request;
    });
    super.onInit();
  }

  Response errorHandler(Response response) {
    debugPrint(response.bodyString);
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
