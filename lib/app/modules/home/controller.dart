import 'package:get/get.dart';
import 'package:larifood_app/app/data/models/logged_user.dart';
import 'package:larifood_app/app/data/providers/favorite.dart';
import 'package:larifood_app/app/data/providers/feed.dart';
import 'package:larifood_app/app/data/providers/like.dart';
import 'package:larifood_app/app/modules/home/models/recipe_feed_chronological.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    loggedUserUser = Get.find<LoggedUser>();

    var response = await feedApi.chronologicalFeed();
    for (var recipe in response['recipes']) {
      recipesList.add(RecipeFeedChronological.fromJson(recipe).obs);
    }

    print('avatar');
    print(loggedUserUser.avatar);
    super.onInit();
  }

  var recipesList = <Rx<RecipeFeedChronological>>[].obs;
  late LoggedUser loggedUserUser;

  favorite(int id) async {
    var recipe = recipesList.where((p0) => p0.value.id == id).toList()[0];
    await favoriteApi.unFavorite(id.toString());
    print(recipe.value.usersFavorites);
    if (recipe.value.usersFavorites) {
      await favoriteApi.unFavorite(id.toString());

      recipe.update((val) {
        val!.usersFavorites = false;
      });
    } else {
      await favoriteApi.favorite(id.toString());

      recipe.update((val) {
        val!.usersFavorites = true;
      });
    }
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

  final FeedApi feedApi;
  final LikeApi likeApi;
  final FavoriteApi favoriteApi;
  HomeController(this.feedApi, this.likeApi, this.favoriteApi);
}
