import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/forgot_password/controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(UserRepository(Get.find<UserApi>())));
  }
}
