import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/models/model/task.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';
import 'package:prueba_jacobo/ui/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<List<Task>>(context);

    if (tasks != null) {
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TaskTile(
              borderColor: tasks[index].colorCode,
              date: tasks[index].date,
              text: tasks[index].text,
            ),
          );
        },
      );
    } else {
        return LoadingWidget();
    }
  }
}
