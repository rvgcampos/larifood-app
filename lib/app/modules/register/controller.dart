import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';

class RegisterController extends GetxController {
  var email = TextEditingController().obs;
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;
  var name = TextEditingController().obs;

  var isFilled = RxBool(false);
  var isHide = RxBool(true);
  var isLoading = RxBool(false);
  var isChecked = RxBool(false);
  var isError = RxBool(false);

  formIsFilled() {
    isFilled.value = email.value.text.isNotEmpty &&
        username.value.text.isNotEmpty &&
        name.value.text.isNotEmpty &&
        password.value.text.isNotEmpty &&
        isChecked.value;
  }

  final UserRepository repository;

  RegisterController(this.repository);

  register() async {
    try {
      isLoading.value = true;
      isError.value = false;

      User user = User(
          email: email.value.text,
          name: name.value.text,
          username: username.value.text,
          password: password.value.text);
      var response = await repository.store(user);
      if (response == null) {
        throw Error();
      }
      isLoading.value = false;
      // Get.toNamed(Routes.LOGIN);
      Get.back();
    } catch (e) {
      isLoading.value = false;
      isError.value = true;
    }
  }

  togglePassword() {
    isHide.value = !isHide.value;
  }
}
