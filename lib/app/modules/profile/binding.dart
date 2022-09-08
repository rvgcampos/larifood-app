import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/profile/controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(
      ProfileController(
        UserRepository(
          Get.find<UserApi>(),
        ),
      ),
    );
  }
}
