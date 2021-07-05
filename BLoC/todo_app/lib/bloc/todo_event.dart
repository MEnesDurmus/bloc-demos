import 'package:todo_app/model/todo_item.dart';

abstract class TodoEvent {
  TodoItem todoItem;
  TodoEvent(this.todoItem);
}

class CheckEvent extends TodoEvent {
  CheckEvent(TodoItem todoItem) : super(todoItem);
}

class AddTodoEvent extends TodoEvent {
  AddTodoEvent(TodoItem todoItem) : super(todoItem);
}

class DeleteTodoEvent extends TodoEvent {
  DeleteTodoEvent(TodoItem todoItem) : super(todoItem);
}
