import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class LoginController extends GetxController {
  // @override
  // void onInit() async {
  //   final box = GetStorage();

  //   if (box.read('token') != null) {
  //     var token = box.read('token') as String;
  //     if (token != '') {
  //       var response = await repository.getDataAboutMe(token);
  //       if (response != null) {
  //         var responseMap = response as Map<String, dynamic>;
  //         responseMap['token'] = {};
  //         responseMap['token']['token'] = token;
  //         Get.put(LoggedUser.fromJson(responseMap as Map<String, dynamic>));
  //         Get.toNamed(Routes.DASHBOARD);
  //       }
  //     }
  //   }

  //   super.onInit();
  // }

  var email = TextEditingController().obs;
  var password = TextEditingController().obs;
  var isError = RxBool(false);

  var isFilled = RxBool(false);
  var isHide = RxBool(true);
  var isLoading = RxBool(false);

  final box = GetStorage();

  formIsFilled() {
    isFilled.value =
        email.value.text.isNotEmpty && password.value.text.isNotEmpty;
  }

  final UserRepository repository;

  LoginController(this.repository);

  login() async {
    try {
      isLoading.value = true;
      isError.value = false;

      Map<String, dynamic> map = {
        'email': email.value.text,
        'password': password.value.text,
      };
      var responseLogin = await repository.login(map);

      // var response =
      //     await repository.getDataAboutMe(responseLogin['token']['token']);
      // print(response);

      Get.put(LoggedUser.fromJson(responseLogin as Map<String, dynamic>));

      box.write('token', responseLogin['token']['token']);

      Get.toNamed(Routes.DASHBOARD);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
    }
  }

  togglePassword() {
    isHide.value = !isHide.value;
  }
}
