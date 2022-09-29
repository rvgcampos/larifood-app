import 'package:larifood_app/app/data/models/user.dart';
import 'package:larifood_app/app/data/providers/api.dart';

class UserApi extends Api {
  Future<dynamic> storeUser(User user) async {
    var response = errorHandler(await post('/users', {
      "email": user.email,
      "name": user.name,
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

  Future<dynamic> updateUser(String id, Map<String, dynamic> map) async {
    var response = errorHandler(await put('/users/$id', map));

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
      // headers: {'Authorization': 'Bearer ${token}'},
    ));

    return response.body;
  }

  Future getDataAboutUser(String id) async {
    var response = errorHandler(await get(
      '/users/$id',
    ));

    return response.body;
  }

  Future logout() async {
    var response = errorHandler(await delete(
      '/sessions',
    ));

    return response.body;
  }
}
