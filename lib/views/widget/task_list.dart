import 'package:flutter/material.dart';
import 'package:flutter_day1/models/model_task.dart';
import 'package:flutter_day1/providers/todo_model.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (_, model,__){
        final tasks =model.filteredTask;
        if(tasks.isEmpty){
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline,size :64 , color: Colors.grey),
            SizedBox(height: 8,),
            Text('No Tasks', style: TextStyle(color: Colors.grey),)
              ]
            ));
        }
        return ListView.builder(
            itemCount: tasks.length,
              padding : EdgeInsets.symmetric(horizontal: 8),
              itemBuilder : (context,index){
              final task = tasks[index];
                TaskItem(task: task,);
              }
    );
  },
);
}
}


class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final ModelTask task;

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}: ${date.hour}:${date.minute.toString().padLeft(2,'8')}';
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white,),
      ),
      onDismissed: (_)=> context.read<TodoModel>().removeTask(task.id),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          leading: Checkbox(
              value: task.isComplete, 
              onChanged: (_) => context.read<TodoModel>().toggleTask(task.id),
          ),
          title: Text (task.title),
          trailing: Text(_formatDate(task.createdAt)),
          onTap: () => context.read<TodoModel>().toggleTask(task.id),
          onLongPress: () => context.read<TodoModel>().removeTask(task.id),
          subtitle: Text(
            _formatDate(task.createdAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
          
        ),
        
      );

  }
}

