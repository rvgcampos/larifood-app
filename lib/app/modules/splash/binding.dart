import 'package:get/get.dart';
import 'package:larifood_app/app/modules/splash/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
