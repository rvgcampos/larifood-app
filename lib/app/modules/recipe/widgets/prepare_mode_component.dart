import 'package:flutter/material.dart';

class PrepareModeComponent extends StatelessWidget {
  final int index;
  final String prepareMode;
  const PrepareModeComponent({
    required this.index,
    required this.prepareMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(
                index.toString(),
                style: const  TextStyle(fontSize: 22),
              ),
            ),
          ),
          Expanded(
            child: Text(
              prepareMode,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
