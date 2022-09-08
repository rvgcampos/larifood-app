import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/login/controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserApi>(UserApi());

    Get.lazyPut<LoginController>(
        () => LoginController(UserRepository(Get.find<UserApi>())));
  }
}
