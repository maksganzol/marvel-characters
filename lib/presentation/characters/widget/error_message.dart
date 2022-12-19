import 'package:flutter/material.dart';
import 'reload_button.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const ReloadButton(),
      ],
    );
  }
}
