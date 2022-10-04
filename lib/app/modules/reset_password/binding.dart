import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/reset_password/controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.put<ResetPasswordController>(
        ResetPasswordController(UserRepository(Get.find<UserApi>())));
  }
}
