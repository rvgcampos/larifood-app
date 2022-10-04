import 'dart:convert';

import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/User.dart';
import 'package:larifood_app/app/data/providers/api.dart';

class FeedApi extends Api {
  Future<dynamic> chronologicalFeed() async {
    var response = errorHandler(await get('/chronological-feed'));

    return response.body;
  }

  Future<dynamic> recommendativeFeed() async {
    var response = errorHandler(await get('/recomendative-feed'));

    return response.body;
  }
}
