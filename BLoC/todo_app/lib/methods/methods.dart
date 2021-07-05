import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item.dart';

Future<TodoItem?> showNewTodoDialog(BuildContext context) async {
  final textController = TextEditingController();
  return showDialog<TodoItem>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              TextField(controller: textController)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop(TodoItem(textController.text));
            },
          ),
        ],
      );
    },
  );
}
