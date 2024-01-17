import 'package:flutter/material.dart';
import 'Model/TaskType.dart';

class TaskTypeDropDownView extends StatefulWidget {
  final Function(TaskType) onChanged;
  final TaskType dropdownValue;

  const TaskTypeDropDownView(
      {super.key, required this.onChanged, required this.dropdownValue});

  @override
  TaskTypeDropDownViewState createState() => TaskTypeDropDownViewState();
}

class TaskTypeDropDownViewState extends State<TaskTypeDropDownView> {
  TaskType dropDownValue = TaskType.practical;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 30.0,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: DropdownButton<TaskType>(
            isExpanded: true,
            underline: Container(),
            value: widget.dropdownValue,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            dropdownColor: const Color.fromRGBO(30, 30, 30, 1),
            iconEnabledColor: Colors.white,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  dropDownValue = value;
                });
                widget.onChanged(value);
              }
            },
            items: const [
              DropdownMenuItem(
                value: TaskType.theoretical,
                child: Text("Theoretical"),
              ),
              DropdownMenuItem(
                value: TaskType.practical,
                child: Text("Practical"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
