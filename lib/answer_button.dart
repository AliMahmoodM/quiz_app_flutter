import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            Colors.blue,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            answer,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
