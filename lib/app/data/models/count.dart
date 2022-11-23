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
        followingCount: json['following_count'],
        followerCount: json['follower_count'],
        recipesCount: json['recipes_count'],
      );
}
