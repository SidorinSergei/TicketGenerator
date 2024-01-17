
import 'package:flutter/material.dart';

class TaskListSearchView extends StatelessWidget {
  final String searchText;
  final ValueChanged<String> onChanged;

  const TaskListSearchView({super.key, required this.searchText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          filled: true,
          isDense: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 0.1),
          labelStyle: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 13),
        onChanged: onChanged,
      ),
    );
  }
}
