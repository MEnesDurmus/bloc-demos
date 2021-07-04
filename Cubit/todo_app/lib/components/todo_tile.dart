import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile(this.todo);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            BlocProvider.of<TodoCubit>(context).checkTodo(todo, value!);
          },
        ),
        Text(todo.item),
        Spacer(),
        GestureDetector(
          onTap: () => BlocProvider.of<TodoCubit>(context).deleteTodo(todo),
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
