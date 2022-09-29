import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/follows.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/another_profile/controller.dart';

class AnotherProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FollowApi());
    Get.lazyPut<AnotherProfileController>(
      () => AnotherProfileController(
        UserRepository(
          Get.find<UserApi>(),
        ),
        Get.find<FollowApi>(),
      ),
    );
  }
}
