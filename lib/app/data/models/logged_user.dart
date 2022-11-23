class LoggedUser {
  int id;
  String email;
  String name;
  String username;
  String token;
  String? avatar;

  LoggedUser({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.token,
    this.avatar,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
        id: json['user']['id'],
        email: json['user']['email'],
        name: json['user']['name'],
        username: json['user']['username'],
        token: json['token']['token'],
        avatar: json['user']['avatar'] != null
            ? ((json['user']['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2'))
            : null,
        // avatar: json['user']['avatar'] != null
        //     ? json['user']['avatar']['url'] as String
        //     : null,
      );
}
