part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoCurrent extends TodoState {
  final List<Todo> todos;

  TodoCurrent(this.todos);
}
