class User {
  int? id;
  String email;
  String username;
  String password;

  User(
      {this.id,
      required this.email,
      required this.username,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
