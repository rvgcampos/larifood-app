import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/register/controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserApi>(UserApi());

    Get.lazyPut<RegisterController>(
        () => RegisterController(UserRepository(Get.find<UserApi>())));
  }
}
