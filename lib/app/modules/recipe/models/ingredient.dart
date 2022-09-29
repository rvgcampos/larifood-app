class Ingredient {
  int? id;
  String name;
  int qtd;
  String qtd_unit;

  Ingredient({
    this.id,
    required this.name,
    required this.qtd,
    required this.qtd_unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'],
        name: json['name'],
        qtd: json['qtd'],
        qtd_unit: json['qtdUnit']['name'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qtd'] = this.qtd;
    data['qtd_unit'] = this.qtd_unit;
    return data;
  }
}
