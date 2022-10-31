import 'package:flutter/cupertino.dart';

class LabelRecipe extends StatelessWidget {
  final String label;
  const LabelRecipe({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        label,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
