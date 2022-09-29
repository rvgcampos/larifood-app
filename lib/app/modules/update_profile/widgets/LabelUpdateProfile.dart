import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LabelUpdateProfile extends StatelessWidget {
  final String name;
  const LabelUpdateProfile({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
