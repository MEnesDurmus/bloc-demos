import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static int lastId = 0;

  void addTodo(Todo todo) {
    if (state is TodoInitial) {
      emit(TodoCurrent([todo]));
    } else if (state is TodoCurrent) {
      emit(TodoCurrent((state as TodoCurrent).todos
        ..add(Todo.copyWith(todo, id: lastId++))));
    }
  }

  void checkTodo(Todo todo, bool isDone) {
    final todos = (state as TodoCurrent).todos.map((e) {
      return e.id == todo.id ? Todo.check(todo) : e;
    }).toList();
    emit(TodoCurrent(todos));
  }

  void deleteTodo(Todo todo) {
    final todos = (state as TodoCurrent)
        .todos
        .where((element) => element != todo)
        .toList();
    if (todos.isEmpty)
      emit(TodoInitial());
    else
      emit(TodoCurrent(todos));
  }
}
