import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/providers/user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    loggedUserUser = Get.find<LoggedUser>();
    super.onInit();
    print(await userRepository.getDataAboutMe(loggedUserUser.token));
  }

  final box = GetStorage();

  late LoggedUser loggedUserUser;

  final UserRepository userRepository;

  ProfileController(this.userRepository);

  logout() {
    box.write('token', '');
    Get.offAllNamed(Routes.LOGIN);
  }
}
