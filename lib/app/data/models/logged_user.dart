class LoggedUser {
  int id;
  String email;
  String username;
  String token;

  LoggedUser({
    required this.id,
    required this.email,
    required this.username,
    required this.token,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
        id: json['user']['id'],
        email: json['user']['email'],
        username: json['user']['username'],
        token: json['token']['token'],
      );
}
