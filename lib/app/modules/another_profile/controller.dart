import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/providers/follows.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/modules/another_profile/models/another_profile.dart';

class AnotherProfileController extends GetxController {
  @override
  void onInit() async {
    var id = Get.arguments[0]['id'];
    profile.value = AnotherProfile.fromJson(
      await userRepository.getDataAboutUser(
        id.toString(),
      ),
    );
    isFollowing.value = profile.value!.isFollowing;
    super.onInit();
  }

  var loggedUserUser = Get.find<LoggedUser>();

  var profile = Rxn<AnotherProfile>();
  var isFollowing = false.obs;

  final UserRepository userRepository;
  final FollowApi followApi;

  followAction() {
    profile.value!.isFollowing
        ? followApi.unfollowUser(profile.value!.id!)
        : followApi.followUser(profile.value!.id!);
    profile.value!.isFollowing = !profile.value!.isFollowing;
    isFollowing.value = !isFollowing.value;
  }

  AnotherProfileController(this.userRepository, this.followApi);
}
