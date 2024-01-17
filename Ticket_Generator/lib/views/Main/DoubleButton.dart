
import 'package:flutter/material.dart';
import 'MenuButton.dart';

class DoubleButton extends StatelessWidget {
  final MenuButton button1;
  final MenuButton button2;

  const DoubleButton({super.key, required this.button1, required this.button2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: button1,
        ),
        button2,
      ],
    );
  }
}