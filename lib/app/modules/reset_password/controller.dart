import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ResetPasswordController extends GetxController {
  @override
  void onInit() {
    // token.value = Get.arguments[0]['token'];
    super.onInit();
  }

  var password = TextEditingController().obs;

  formIsFilled() {
    isFilled.value = password.value.text.isNotEmpty;
  }

  var formError = ''.obs;
  var token = ''.obs;
  var isFilled = RxBool(false);
  var isLoading = RxBool(false);

  void resetPassword() async {
    formError.value = '';
    var response = await repository.reset({
      'token': token.value,
      'password': password.value.text,
    });
    print(response);
    if (response['code'] == 'TOKEN_EXPIRED') {
      formError.value = 'TOKEN_EXPIRED';
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  final UserRepository repository;
  ResetPasswordController(this.repository);
}
