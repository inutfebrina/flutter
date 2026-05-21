import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_day1/providers/todo_model.dart';

class TaskStats extends StatelessWidget {
  const TaskStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoModel, (int, int)>(
      selector: (context, todoModel) => (todoModel.activeCount, todoModel.completedCount),
      builder: (_,data,__) {
        final (active,completed) = data;
        return Padding(
          padding:  EdgeInsetsGeometry.fromLTRB(16, 12, 16, 4),
          child: Text(
            '$active Active, $completed Completed',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        );
      },
    );
  }
}
