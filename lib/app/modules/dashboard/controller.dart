import 'package:get/get.dart';
import 'package:larifood_app/app/routes/routes.dart';

class DashboardController extends GetxController {
  var currentPageIndex = 0.obs;

  void changePageIndex(int index) async {
    currentPageIndex.value = index;
    if (index == 0) {
      await Get.offNamed(Routes.HOME, id: 1);
    } else if (index == 1) {
      await Get.offNamed(Routes.SEARCH, id: 1);
    } else if (index == 2) {
      await Get.offNamed(Routes.PUBLISH, id: 1);
    } else if (index == 3) {
      await Get.offNamed(Routes.REELS, id: 1);
    } else if (index == 4) {
      await Get.offNamed(Routes.PROFILE, id: 1);
    }
  }
}
