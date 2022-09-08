import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/providers/api.dart';

class UserApi extends Api {
  Future<dynamic> storeUser(User user) async {
    var response = errorHandler(await post('/users', {
      "email": user.email,
      "username": user.username,
      "password": user.password,
    }));

    return response.body;
  }

  Future loginUser(Map<String, dynamic> map) async {
    var response = errorHandler(await post('/sessions', {
      "email": map['email'],
      "password": map['password'],
    }));

    return response.body;
  }

  Future<dynamic> recoveryPassword(Map<String, dynamic> map) async {
    var response = errorHandler(await post('/forgot-password', {
      "email": map['email'],
      "resetPasswordUrl": 'url',
    }));

    return response.body;
  }

  Future getDataAboutMe(String token) async {
    var response = errorHandler(await get(
      '/users',
      headers: {'Authorization': 'Bearer ${token}'},
    ));

    return response.body;
  }
}
