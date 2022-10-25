import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final bool isFilled;
  final Function onPressed;
  final GlobalKey<FormState> formKey;
  final String label;
  final bool isLoading;
  final bool conditionalValidate;

  ActionButton({
    super.key,
    required this.isFilled,
    required this.onPressed,
    required this.formKey,
    required this.label,
    this.isLoading = false,
    this.conditionalValidate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 60),
          backgroundColor: Colors.red,
        ),
        onPressed: isFilled
            ? () {
                // if (formKey.currentState!.validate()) {
                onPressed();
                // }
              }
            : null,
        child: isLoading
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
