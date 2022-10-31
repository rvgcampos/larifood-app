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

  Map<String, dynamic> toJson([bool isUpdate = false, dynamic newValue]) {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['qtd'] = qtd;
    data['qtd_units_id'] = isUpdate ? newValue : qtd_unit;
    return data;
  }
}
