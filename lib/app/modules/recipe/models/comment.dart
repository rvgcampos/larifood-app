import 'package:larifood_app/app/data/models/user.dart';

class Comment {
  int? id;
  String content;
  int userId;
  int recipeId;
  User user;

  Comment({
    this.id,
    required this.content,
    required this.userId,
    required this.recipeId,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'],
        content: json['content'],
        userId: json['user_id'],
        recipeId: json['recipe_id'],
        user: User.fromJson(json['user']),
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   return data;
  // }
}
