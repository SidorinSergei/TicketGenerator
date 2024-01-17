
import 'package:flutter/material.dart';

class CustomTextEditor extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const CustomTextEditor({super.key, required this.text, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 300.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          maxLines: null,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}