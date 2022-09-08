import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';

class RegisterController extends GetxController {
  var email = TextEditingController().obs;
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;

  var isFilled = RxBool(false);
  var isHide = RxBool(true);
  var isLoading = RxBool(false);
  var isChecked = RxBool(false);

  formIsFilled() {
    isFilled.value = email.value.text.isNotEmpty &&
        username.value.text.isNotEmpty &&
        password.value.text.isNotEmpty && isChecked.value;
  }

  final UserRepository repository;

  RegisterController(this.repository);

  register() async {
    isLoading.value = true;
    User user = User(
        email: email.value.text,
        username: username.value.text,
        password: password.value.text);
    await repository.store(user);
    isLoading.value = false;
  }

  togglePassword() {
    isHide.value = !isHide.value;
  }
}
