import 'package:flutter/material.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_event.dart';
import 'package:todo_app/model/todo_item.dart';

Widget buildBottomSheet(BuildContext context, TodoBloc bloc) {
  final textController = TextEditingController();
  textController.text = 'default';
  return Container(
    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
    height: MediaQuery.of(context).size.height * 3 / 4,
    child: Center(
        child: Column(
      children: [
        Text('Add your todo item'),
        TextField(controller: textController),
        ElevatedButton(
            onPressed: () {
              bloc.todoEventSink
                  .add(AddTodoEvent(TodoItem(textController.text)));
              Navigator.pop(context);
            },
            child: Text('Add Item'))
      ],
    )),
  );
}
