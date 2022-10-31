import 'package:larifood_app/app/data/models/user.dart';

class RecipeFeedChronological {
  int? id;
  String name;
  int prepareTime;
  int isPrivate;
  String createdAt;
  String updatedAt;
  int prepareTimeUnitId;
  int userId;
  int categoryId;
  String? avatar;
  User? user;
  bool usersFavorites;
  bool usersLikes;

  RecipeFeedChronological({
    this.id,
    required this.name,
    required this.prepareTime,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
    required this.prepareTimeUnitId,
    required this.userId,
    required this.categoryId,
    required this.usersFavorites,
    required this.usersLikes,
    this.avatar,
    this.user,
  });

  factory RecipeFeedChronological.fromJson(Map<String, dynamic> json) =>
      RecipeFeedChronological(
        id: json['id'],
        name: json['name'],
        prepareTime: json['prepare_time'],
        isPrivate: json['is_private'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        prepareTimeUnitId: json['prepare_time_unit_id'],
        userId: json['user_id'],
        categoryId: json['category_id'],
        avatar: json['avatar'] != null
            ? ((json['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2'))
            : null,
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        usersLikes: (json['usersLikes'] as List).isNotEmpty
            ? json['usersLikes'][0]['is_liked'] == 0
                ? false
                : true
            : false,
        usersFavorites: (json['usersFavorites'] as List).isEmpty ? false : true,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['prepareTime'] = prepareTime;
    data['isPrivate'] = isPrivate;
    data['prepareTimeUnitId'] = prepareTimeUnitId;
    data['userId'] = userId;
    data['categoryId'] = categoryId;
    return data;
  }
}
