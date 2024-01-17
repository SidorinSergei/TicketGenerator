
import 'package:flutter/material.dart';
import 'CustomTextFieldView.dart';

class TaskAddInputView extends StatefulWidget {
  final String title;
  final ValueChanged<String> onTextChanged;

  const TaskAddInputView({
    Key? key,
    required this.title,
    required this.onTextChanged,
  }) : super(key: key);

  @override
  TaskAddInputViewState createState() => TaskAddInputViewState();
}

class TaskAddInputViewState extends State<TaskAddInputView> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        const SizedBox(width: 8),
        CustomTextFieldView(
          onTextChanged: (value) {
            setState(() {
              text = value;
            });
          },
        ),
      ],
    );
  }
}
