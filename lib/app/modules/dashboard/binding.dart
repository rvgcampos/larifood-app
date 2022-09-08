import 'package:get/get.dart';
import 'package:larifood_app/app/modules/dashboard/controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    
    Get.put<DashboardController>(DashboardController());
  }
}
