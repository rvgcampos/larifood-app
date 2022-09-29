import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final Widget? widget;
  Label({required this.label, this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              widget == null ? Container() : widget!
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
