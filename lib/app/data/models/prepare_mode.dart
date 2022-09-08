class PrepareMode {
  int? id;
  String description;

  PrepareMode({
    this.id,
    required this.description,
  });

  factory PrepareMode.fromJson(Map<String, dynamic> json) => PrepareMode(
        id: json['id'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['description'] = this.description;
    return data;
  }
}
