import 'package:larifood_app/app/data/providers/api.dart';

class FollowApi extends Api {
  Future<dynamic> followUser(int id) async {
    var response = errorHandler(await post('/follow', {
      "followingId": id,
    }));

    return response.body;
  }

  Future<dynamic> unfollowUser(int id) async {
    var response = errorHandler(await post('/unfollow', {
      "followingId": id,
    }));

    return response.body;
  }
}
