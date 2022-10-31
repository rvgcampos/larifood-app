class Count {
  int? id;
  int followingCount;
  int followerCount;
  int recipesCount;

  Count({
    this.id,
    required this.followingCount,
    required this.followerCount,
    required this.recipesCount,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
      id: json['id'],
      followingCount: int.parse(json['following_count']),
      followerCount: int.parse(json['follower_count']),
      recipesCount: int.parse(json['recipes_count']));
}
