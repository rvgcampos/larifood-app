import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/modules/update_profile/controller.dart';

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserApi());
    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(
        Get.find<UserApi>(),
      ),
    );
  }
}
