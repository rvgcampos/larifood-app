import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/splash/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserApi>(UserApi());

    Get.put<SplashController>(
        SplashController(UserRepository(Get.find<UserApi>())));
  }
}
