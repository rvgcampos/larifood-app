class Ingredient {
  int? id;
  String name;
  int qtd;
  int qtd_units_id;
 

  Ingredient({
    this.id,
    required this.name,
    required this.qtd,
    required this.qtd_units_id,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'],
        name: json['name'],
        qtd: json['qtd'],
        qtd_units_id: json['qtd_units_id'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qtd'] = this.qtd;
    data['qtd_units_id'] = this.qtd_units_id;
    return data;
  }
}
