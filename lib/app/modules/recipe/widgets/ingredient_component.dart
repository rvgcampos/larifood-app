import 'package:flutter/material.dart';

class IngredientComponent extends StatelessWidget {
  final String name;
  final String qtd;
  final String qtdUnit;
  const IngredientComponent({
    required this.name,
    required this.qtd,
    required this.qtdUnit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 20),
          children: [
            TextSpan(text: name),
            const TextSpan(text: ' | ', style: TextStyle(color: Colors.red)),
            TextSpan(text: '$qtd '),
            TextSpan(text: qtdUnit),
          ],
        ),
      ),
    );
  }
}
