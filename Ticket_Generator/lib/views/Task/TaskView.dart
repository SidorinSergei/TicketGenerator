import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ticket_generator/Services/DataService/Entities/TaskDB.dart';

class TaskView extends StatelessWidget {
  final TaskDB task;
  final Function(TaskDB) onDelete;

  const TaskView({super.key, required this.task, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Type:  ${task.type.toString().split('.').last}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Complexity:  ${task.complexity.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: IconButton(
                      splashRadius: 15,
                      padding: EdgeInsets.zero,
                      iconSize: 15,
                      onPressed: () {
                        onDelete(task);
                      },
                      icon: const Icon(
                        CupertinoIcons.trash,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  task.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
