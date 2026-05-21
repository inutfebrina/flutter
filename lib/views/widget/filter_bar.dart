import 'package:flutter/material.dart';
import 'package:flutter_day1/models/model_task.dart';
import 'package:flutter_day1/providers/todo_model.dart';
import 'package:provider/provider.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TodoModel, TaskFilter>(
      selector: (context, model) => model.filter,
      builder: (context, filter, child) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton(segments: const[
              ButtonSegment(value: TaskFilter.all, label: Text('Semua')),
              ButtonSegment(value: TaskFilter.active, label: Text('Aktif')),
              ButtonSegment(value: TaskFilter.completed, label: Text('Selesai')),
            ], selected: {filter},
              onSelectionChanged: (s)=> context.read<TodoModel>().setFilter(s.first),
            ),
        );
      }
    );
  }
}
