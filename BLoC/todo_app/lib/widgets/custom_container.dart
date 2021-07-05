import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_event.dart';
import 'package:todo_app/model/todo_item.dart';

class CustomContainer extends StatelessWidget {
  final TodoItem item;
  final TodoBloc bloc;

  CustomContainer(this.item, this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: item.checked,
              onChanged: (b) {
                bloc.todoEventSink.add(CheckEvent(item..checked = b!));
              }),
          Text(item.text),
          Expanded(
              child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    bloc.todoEventSink.add(DeleteTodoEvent(item));
                  },
                  child: Icon(Icons.delete))
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ))
        ],
      ),
    );
  }
}
