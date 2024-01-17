import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:ticket_generator/Services/DataService/Entities/TaskDB.dart';
import '../Main/MenuButton.dart';
import 'Model/TaskType.dart';
import 'TaskAddInputView.dart';
import 'TaskTypeDropDownView.dart';

class TaskAddView extends StatefulWidget {
  final Function? onContinue;
  final Function? onDismiss;
  final Function(TaskDB) onAdd;

  const TaskAddView({super.key, required this.onAdd, this.onContinue, this.onDismiss});

  @override
  TaskAddViewState createState() => TaskAddViewState();
}

class TaskAddViewState extends State<TaskAddView> {
  String description = '';
  String complexity = '';
  String answer = '';
  TaskType type = TaskType.practical;
  String number = "";

  void _onDropdownChanged(TaskType newValue) {
    setState(() {
      type = newValue;
    });
  }

  TaskDB _formTask() {
    return TaskDB(
        ObjectId(),
        type.toString(),
        int.tryParse(number) ?? 1,
        description,
        answer,
        int.tryParse(complexity) ?? 1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            TaskAddInputView(
              title: 'Task Number',
              onTextChanged: (value) {
                setState(() {
                  number = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TaskAddInputView(
              title: 'Complexity',
              onTextChanged: (value) {
                setState(() {
                  complexity = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TaskAddInputView(
              title: 'Answer',
              onTextChanged: (value) {
                setState(() {
                  answer = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Type',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
                const SizedBox(width: 8),
                TaskTypeDropDownView(
                  onChanged: _onDropdownChanged,
                  dropdownValue: type,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                    ),
                    style: const TextStyle(fontSize: 12.0, color: Colors.white),
                    maxLines: null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Spacer(),
                MenuButton(
                  title: 'Cancel',
                  width: 60,
                  onPressed: () {
                    if (widget.onDismiss != null) {
                      widget.onDismiss!();
                    }
                  },
                ),
                const SizedBox(width: 8),
                MenuButton(
                  title: 'Add',
                  width: 50,
                  onPressed: () {
                    if (widget.onContinue != null) {
                      widget.onAdd(_formTask());
                      widget.onContinue!();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
