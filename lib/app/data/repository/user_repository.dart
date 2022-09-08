import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/providers/user.dart';

class UserRepository {
  final UserApi api;

  UserRepository(this.api);

  Future store(User user) async {
    await api.storeUser(user);
  }

  Future login(Map<String, dynamic> map) async {
    var response = await api.loginUser(map);
    return response;
  }

  Future recovery(Map<String, dynamic> map) async {
    await api.recoveryPassword(map);
  }

  Future getDataAboutMe(String token) async {
    var response = await api.getDataAboutMe(token);
    return response;
  }
}
