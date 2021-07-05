import 'package:todo_app/model/todo_item.dart';

class TodoItems {
  final List<TodoItem> items;

  TodoItems(this.items);
}

TodoItems initialData = TodoItems(<TodoItem>[]);
// TodoItems initialData = TodoItems(<TodoItem>[
//   TodoItem(0, "First Item"),
//   TodoItem(1, "Second Item"),
// ]);
