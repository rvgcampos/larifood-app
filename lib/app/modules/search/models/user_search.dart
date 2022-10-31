class UserSearch {
  int? id;
  String email;
  String name;
  String username;
  String? avatar;

  UserSearch({
    this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.avatar,
  });

  factory UserSearch.fromJson(Map<String, dynamic> json) => UserSearch(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        username: json['username'],
        avatar: json['avatar'] != null
            ? ((json['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2'))
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['username'] = username;
    data['avatar'] = avatar;
    return data;
  }
}
