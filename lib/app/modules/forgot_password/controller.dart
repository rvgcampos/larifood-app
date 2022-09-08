import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';

class ForgotPasswordController extends GetxController {
  var email = TextEditingController().obs;

  var isFilled = RxBool(false);
  var isLoading = RxBool(false);

  formIsFilled() {
    isFilled.value = email.value.text.isNotEmpty;
  }

  final UserRepository repository;

  ForgotPasswordController(this.repository);

  Future recovery() async {
    isLoading.value = true;
    Map<String, dynamic> map = {
      'email': email.value.text,
    };
    await repository.recovery(map);
    isLoading.value = false;
    // email.value.clear();
    Get.snackbar(
      'E-mail enviado',
      'Por favor, verifique sua caixa de entrada',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      // padding: EdgeInsets.only(bottom: 20)
      margin: EdgeInsets.all(10),
    );
  }
}
