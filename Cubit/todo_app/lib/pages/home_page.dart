import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/pages/home_page_methods.dart';

class HomePage extends StatelessWidget with HomePageMethods {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App with Cubit'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () =>
                buildBottomSheet(context, BlocProvider.of<TodoCubit>(context)),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return Center(
              child: Text('There is nothin\' todo.'),
            );
          } else if (state is TodoCurrent) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => TodoTile(state.todos[index]),
            );
          } else {
            throw Exception('Error in BlocBuilder.builder');
          }
        },
      ),
    );
  }
}
