import 'package:get/get.dart';
import 'package:larifood_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    // Get.lazyPut<HomeController>(() => HomeController());
  }
}
