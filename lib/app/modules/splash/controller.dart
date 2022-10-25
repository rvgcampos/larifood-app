import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';
import 'package:uni_links/uni_links.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    final box = GetStorage();

    // try {
    //   final initialLink = await getInitialLink();
    //   print(initialLink);

    //   if (initialLink != null) {
    //     print(initialLink.substring(18));
    //     var token = initialLink.substring(18);
    //     Get.toNamed(Routes.RESET_PASSWORD, arguments: [
    //       {'token': token}
    //     ]);
    //     return;
    //   }
    // } on PlatformException {}

    // if (box.read('token') != null) {
    //   var token = box.read('token') as String;
    //   if (token != '') {
    //     var response = await repository.getDataAboutMe(token);
    //     print('responseAboutMe ' + response.toString());
    //     if (response['code'] != 'BAD_REQUEST') {
    //       try {
    //         var responseMap = response as Map<String, dynamic>;
    //         responseMap['token'] = {};
    //         responseMap['token']['token'] = token;
    //         Get.put(LoggedUser.fromJson(responseMap as Map<String, dynamic>));
    //         Get.toNamed(Routes.DASHBOARD);
    //       } catch (e) {}
    //     } else {
    //       isInvalidToken = true;
    //     }
    //   }
    // }
    super.onInit();
  }

  var isInvalidToken = false;

  @override
  void onReady() async {

    try {
      final initialLink = await getInitialLink();
      debugPrint(initialLink);

      if (initialLink != null) {
        debugPrint(initialLink.substring(18));
        var token = initialLink.substring(18);
        Get.toNamed(Routes.RESET_PASSWORD, arguments: [
          {'token': token}
        ]);
        return;
      }
    } on PlatformException {}

    
    if (box.read('token') != null) {
      var token = box.read('token') as String;
      if (token != '') {
        var response = await repository.getDataAboutMe(token);
        print('responseAboutMe ' + response.toString());
        if (response['code'] != 'BAD_REQUEST') {
          try {
            var responseMap = response as Map<String, dynamic>;
            responseMap['token'] = {};
            responseMap['token']['token'] = token;
            Get.put(LoggedUser.fromJson(responseMap as Map<String, dynamic>));
            Get.toNamed(Routes.DASHBOARD);
          } catch (e) {}
        } else {
          isInvalidToken = true;
        }
      }
    }

    if (box.read('token') == null ||
        box.read('token') == '' ||
        isInvalidToken == true) {
      Get.toNamed(Routes.LOGIN);
    }
    super.onReady();
  }

  final box = GetStorage();
  final UserRepository repository;
  SplashController(this.repository);
}
