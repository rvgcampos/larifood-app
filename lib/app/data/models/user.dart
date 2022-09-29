class User {
  int? id;
  String email;
  String name;
  String username;
  String? password;
  String? avatar;

  User({
    this.id,
    required this.email,
    required this.name,
    required this.username,
    this.password,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        username: json['username'],
        avatar: json['avatar'] != null
            ? ((json['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2'))
            : null,
        // password: json['password'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
