class RecipeSimilar {
  int? id;
  String name;
  String createdAt;
  String updatedAt;
  int userId;
  String? avatar;

  RecipeSimilar({
    this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    this.avatar,
  });

  factory RecipeSimilar.fromJson(Map<String, dynamic> json) => RecipeSimilar(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        userId: json['user_id'],
        avatar: json['avatar'] != null
            ? ((json['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2'))
            : null,
      );

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['name'] = name;
  //   data['prepareTime'] = prepareTime;
  //   data['isPrivate'] = isPrivate;
  //   data['prepareTimeUnitId'] = prepareTimeUnitId;
  //   data['userId'] = userId;
  //   data['categoryId'] = categoryId;
  //   return data;
  // }

  @override
  String toString() {
    return avatar != null ? avatar! : '';
  }
}
