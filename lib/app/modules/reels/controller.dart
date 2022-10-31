import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:larifood_app/app/data/providers/feed.dart';
import 'package:larifood_app/app/data/providers/like.dart';
import 'package:larifood_app/app/modules/reels/models/recipe_feed_recommendative.dart';

class ReelsController extends GetxController {
  @override
  void onInit() async {
    var response = await feedApi.recommendativeFeed();
    for (var recipe in response['similaridades']) {
      recipesList
          .add(RecipeFeedRecommendative.fromJson(recipe['recipeTo']).obs);
    }

    for (var recipe in response['userRecipesLiked']) {
      recipesList.add(RecipeFeedRecommendative.fromJson(recipe['recipe']).obs);
    }
    debugPrint(recipesList.length.toString());
    super.onInit();
  }

  like(int id) async {
    var recipe = recipesList.where((p0) => p0.value.id == id).toList()[0];

    if (recipe.value.usersLikes) {
      recipe.update((val) {
        val!.usersLikes = false;
      });
    } else {
      recipe.update((val) {
        val!.usersLikes = true;
      });
    }

    await likeApi.like(id);
  }

  var recipesList = <Rx<RecipeFeedRecommendative>>[].obs;

  final FeedApi feedApi;
  final LikeApi likeApi;

  ReelsController(this.feedApi, this.likeApi);
}
