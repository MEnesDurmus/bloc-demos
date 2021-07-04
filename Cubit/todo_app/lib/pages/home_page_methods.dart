import 'package:flutter/material.dart';
import 'package:todo_app/cubit/todo_cubit.dart';
import 'package:todo_app/models/todo.dart';

class HomePageMethods {
  void buildBottomSheet(BuildContext context, TodoCubit todoCubit) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        TextEditingController controller = TextEditingController();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(labelText: 'TODO:'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      try {
                        todoCubit.addTodo(Todo(item: controller.text));
                      } catch (e) {
                        print(e.toString());
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Add Todo'))
              ],
            ),
          ),
        );
      },
    );
  }
}
