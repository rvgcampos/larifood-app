import 'package:larifood_app/app/data/models/user.dart';
import 'package:larifood_app/app/data/providers/user.dart';

class UserRepository {
  final UserApi api;

  UserRepository(this.api);

  Future store(User user) async {
    return await api.storeUser(user);
  }

  Future login(Map<String, dynamic> map) async {
    var response = await api.loginUser(map);
    return response;
  }

  Future recovery(Map<String, dynamic> map) async {
    await api.recoveryPassword(map);
  }

   Future reset(Map<String, dynamic> map) async {
    return await api.resetPassword(map);
  }


  Future getDataAboutMe(String token) async {
    var response = await api.getDataAboutMe(token);
    return response;
  }

  Future getDataAboutUser(String id) async {
    var response = await api.getDataAboutUser(id);
    return response;
  }

  Future logout() async {
    var response = await api.logout();
    return response;
  }
}
