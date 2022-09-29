import 'package:larifood_app/app/data/models/count.dart';
import 'package:larifood_app/app/data/models/recipe.dart';

class OwnProfile {
  int? id;
  String name;
  String username;
  String description;
  String email;
  String? avatar;
  List<Recipe> recipes;
  Count count;

  OwnProfile({
    this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.description,
    required this.avatar,
    required this.recipes,
    required this.count,
  });

  factory OwnProfile.fromJson(Map<String, dynamic> json) => OwnProfile(
        id: json['user']['id'],
        username: json['user']['username'],
        name: json['user']['name'],
        description: json['user']['description'] ?? '',
        email: json['user']['email'],
        avatar: json['user']['avatar'] != null
            ? (json['user']['avatar']['url'] as String)
                .replaceAll('0.0.0.0', '10.0.2.2')
            : null,
        recipes: (json['user']['recipes'] as List)
            .map((e) => Recipe.fromJson(e))
            .toList(),
        count: Count.fromJson(json['user']['meta']),
      );

  @override
  String toString() {
    return 'E-MAIL: $email';
  }
}
