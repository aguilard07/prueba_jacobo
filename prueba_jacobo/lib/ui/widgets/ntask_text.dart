import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/models/model/task.dart';

class NTaskText extends StatefulWidget {
  @override
  _NTaskTextState createState() => _NTaskTextState();
}

class _NTaskTextState extends State<NTaskText> {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<List<Task>>(context);
    int value;
    if (tasks != null) {
      return Text(
        'You have ${tasks.length}  tasks',
        style: TextStyle(fontSize: 10),
        textAlign: TextAlign.left,
      );
    } else {
      return Text(
        'You have 0  tasks',
        style: TextStyle(fontSize: 10),
        textAlign: TextAlign.left,
      );
    }
  }
}
