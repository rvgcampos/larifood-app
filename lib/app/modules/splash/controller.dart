import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/repository/user_repository.dart';
import 'package:larifood_app/app/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    final box = GetStorage();
    if (box.read('token') != null) {
      var token = box.read('token') as String;
      if (token != '') {
        var response = await repository.getDataAboutMe(token);
        print(response);
        if (response['code'] != 'BAD_REQUEST') {
          var responseMap = response as Map<String, dynamic>;
          responseMap['token'] = {};
          responseMap['token']['token'] = token;
          Get.put(LoggedUser.fromJson(responseMap as Map<String, dynamic>));
          Get.toNamed(Routes.DASHBOARD);
        } else {
          isInvalidToken = true;
        }
      }
      super.onInit();
    }
  }

  var isInvalidToken = false;

  @override
  void onReady() {
    print(isInvalidToken);
    if (box.read('token') == null ||
        box.read('token') == '' ||
        isInvalidToken == true) {
      Get.toNamed(Routes.LOGIN);
    }
    super.onReady();
  }

  final box = GetStorage();
  final UserRepository repository;
  SplashController(this.repository);
}
