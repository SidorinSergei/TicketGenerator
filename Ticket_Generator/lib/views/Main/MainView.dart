
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:ticket_generator/Services/DataService/TaskDBManager.dart';
import 'package:ticket_generator/Services/DataService/Entities/TaskDB.dart';
import 'TasksSection.dart';
import 'HeaderSection.dart';
import 'TemplateSection.dart';
import '../Task/TaskListView.dart';

class MainView extends StatefulWidget {

  final TaskDBManager taskManager;

  const MainView({super.key, required this.taskManager});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  String text = '';
  late RealmResults<TaskDB> tasks;

  onDeleteAll() {
    debugPrint('Deleting all tasks');
    if (widget.taskManager.deleteAll()) {
      loadItems();
    } else {
      debugPrint('Something went wrong while deleting all tasks');
    }
  }

  onDelete(TaskDB task) {
    debugPrint('Deleting ${task.id}');
    if (widget.taskManager.deleteTask(task)) {
      loadItems();
    } else {
      debugPrint('Something went wrong while deleting ${task.id}');
    }
  }

  onAdd(TaskDB task) {
    debugPrint('Adding ${task.id}');
    if (widget.taskManager.addTask(task)) {
      debugPrint('Added ${task.id}');
      loadItems();
    } else {
      debugPrint('Something went wrong while adding ${task.id}');
    }
  }

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() {
    setState(() {
      tasks = widget.taskManager.getAllTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const HeaderSection(),
              TemplateSection(
                text: text,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
              TasksSection(onAdd: onAdd, onDeleteAll: onDeleteAll,),
              TaskListView(tasks: tasks.toList(), onDelete: onDelete,)
            ],
          ),
        ),
      ),
    );
  }
}