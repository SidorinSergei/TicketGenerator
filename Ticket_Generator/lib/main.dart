import 'package:flutter/material.dart';
import 'package:ticket_generator/views/Main/MainView.dart';
import 'Services/DataService/TaskDBManager.dart';

Future<void> main() async {

  final TaskDBManager taskManager = TaskDBManager();

  runApp(MyApp(taskManager: taskManager));
}

class MyApp extends StatelessWidget {
  final TaskDBManager taskManager;

  const MyApp({super.key, required this.taskManager});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Generator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainView(taskManager: taskManager,),
      debugShowCheckedModeBanner: false,
    );
  }
}