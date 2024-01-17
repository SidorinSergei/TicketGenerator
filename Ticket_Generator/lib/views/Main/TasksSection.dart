
import 'package:flutter/material.dart';
import 'MenuButton.dart';
import '../Task/TaskAddView.dart';
import 'package:ticket_generator/Services/DataService/Entities/TaskDB.dart';

class TasksSection extends StatelessWidget {
  final Function(TaskDB) onAdd;
  final Function onDeleteAll;

  const TasksSection({super.key, required this.onAdd, required this.onDeleteAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Text(
            'Tasks',
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          const Spacer(),

          const MenuButton(title: "Read from file"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: MenuButton(title: 'Add', color: Colors.blueAccent,
              onPressed: () {
                _showAddTaskView(context);
              },
            ),
          ),
          MenuButton(title: 'Reset', color: Colors.redAccent, dbAction: onDeleteAll,),
        ],
      ),
    );
  }

  void _showAddTaskView(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 400,
            width: 700,
            child: TaskAddView(
              onAdd: onAdd,
              onContinue: () {
                Navigator.of(context).pop();
              },
              onDismiss: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}