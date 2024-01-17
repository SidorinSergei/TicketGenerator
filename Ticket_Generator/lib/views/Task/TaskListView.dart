
import 'package:flutter/material.dart';
import 'TaskView.dart';
import 'Model/TaskType.dart';
import '../Main/MenuButton.dart';
import 'Model/TaskFilterState.dart';
import 'TaskListSearchView.dart';
import 'package:ticket_generator/Services/DataService/Entities/TaskDB.dart';


class TaskListView extends StatefulWidget {
  final List<TaskDB> tasks;
  final Function(TaskDB) onDelete;

  const TaskListView({Key? key, required this.tasks, required this.onDelete}) : super(key: key);

  @override
  TaskListViewState createState() => TaskListViewState();
}

class TaskListViewState extends State<TaskListView> {
  TaskFilterState _filter = TaskFilterState.all;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TaskListSearchView(
                searchText: _searchText,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
              const SizedBox(width: 8),
              _buildFilterButton('practical', TaskFilterState.practical),
              _buildFilterButton('theoretical', TaskFilterState.theoretical),
            ],
          ),
          const SizedBox(height: 8),
        ...widget.tasks
              .where((task) {
                final bool filterByType = _filter == TaskFilterState.all ||
                    (_filter == TaskFilterState.theoretical &&
                        task.type == TaskType.theoretical.toString()) ||
                    (_filter == TaskFilterState.practical &&
                        task.type == TaskType.practical.toString());
                final bool filterByText = task.description
                    .toLowerCase()
                    .contains(_searchText.toLowerCase());
                return filterByType && filterByText;
            })
            .map((task) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TaskView(task: task, onDelete: widget.onDelete,),
                ))
            .toList(),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, TaskFilterState type) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: MenuButton(
        title: label,
        borderColor: _filter.doesInclude(type) ? Colors.white : Colors.transparent,
        onPressed: () {
          setState(() {
            _filter = _filter.updatedWith(type);
          });
        },
      ),
    );
  }
}
