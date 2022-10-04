import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/models/own_profile.dart';
import 'package:larifood_app/app/data/models/recipe.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    loggedUserUser = Get.find<LoggedUser>();
    super.onInit();
    var response = await userRepository.getDataAboutMe(loggedUserUser.token);
    ownProfile.value = OwnProfile.fromJson(response as Map<String, dynamic>);
    recipes = ownProfile.value!.recipes;
    print(ownProfile.value);
  }

  final box = GetStorage();

  late LoggedUser loggedUserUser;
  var ownProfile = Rxn<OwnProfile>();
  var isPrivate = false.obs;
  var recipes = <Recipe>[];

  final UserRepository userRepository;

  ProfileController(this.userRepository);

  onlyPrivate() {
    isPrivate.value = !isPrivate.value;
    ownProfile.value!.recipes = recipes;
    if (isPrivate.value) {
      ownProfile.update((val) {
        val!.recipes = ownProfile.value!.recipes
            .where((element) => element.isPrivate == 1)
            .toList();
      });
    } else {
      ownProfile.update((val) {
        val!.recipes = ownProfile.value!.recipes
            .where(
                (element) => element.isPrivate == 0 || element.isPrivate == 1)
            .toList();
      });
    }
  }

  logout() async {
    box.write('token', '');
    await userRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
