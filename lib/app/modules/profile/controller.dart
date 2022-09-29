import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/models/own_profile.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    loggedUserUser = Get.find<LoggedUser>();
    super.onInit();
    var response = await userRepository.getDataAboutMe(loggedUserUser.token);
    ownProfile.value = OwnProfile.fromJson(response as Map<String, dynamic>);
    print(ownProfile.value);
  }

  final box = GetStorage();

  late LoggedUser loggedUserUser;
  var ownProfile = Rxn<OwnProfile>();

  final UserRepository userRepository;

  ProfileController(this.userRepository);

  logout() async {
    box.write('token', '');
    await userRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
