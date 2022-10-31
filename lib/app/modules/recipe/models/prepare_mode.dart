class PrepareMode {
  int? id;
  int order;
  String description;

  PrepareMode({
    this.id,
    required this.description,
    required this.order,
  });

  factory PrepareMode.fromJson(Map<String, dynamic> json) => PrepareMode(
        id: json['id'],
        description: json['description'],
        order: json['order'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['description'] = description;
    data['order'] = order;
    return data;
  }
}
