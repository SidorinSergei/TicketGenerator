
import 'package:flutter/material.dart';

import 'CustomTextEditor.dart';

class TemplateSection extends StatelessWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const TemplateSection({super.key, required this.text, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Template',
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
        ),
        CustomTextEditor(text: text, onChanged: onChanged),
      ],
    );
  }
}