import 'package:larifood_app/app/data/models/count.dart';
import 'package:larifood_app/app/data/models/recipe.dart';

class AnotherProfile {
  int? id;
  String username;
  String email;
  String? avatar;
  List<Recipe> recipes;
  Count count;
  bool isFollowing;

  AnotherProfile({
    this.id,
    required this.username,
    required this.email,
    required this.avatar,
    required this.recipes,
    required this.count,
    required this.isFollowing,
  });

  factory AnotherProfile.fromJson(Map<String, dynamic> json) => AnotherProfile(
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      avatar:
          json['user']['avatar'] != null ? json['user']['avatar']['url'] : null,
      recipes: (json['user']['recipes'] as List)
          .map((e) => Recipe.fromJson(e))
          .toList(),
      count: Count.fromJson(json['user']['meta']),
      isFollowing: json['isFollowing']);
}
