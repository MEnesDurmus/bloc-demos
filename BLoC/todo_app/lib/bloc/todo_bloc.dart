import 'dart:async';

import 'package:todo_app/bloc/todo_event.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/model/todos.dart';

class TodoBloc {
  TodoItems _list = TodoItems(<TodoItem>[]);

  final _todoStateController = StreamController<TodoItems>();
  StreamSink<TodoItems> get _inTodo => _todoStateController.sink;
  Stream<TodoItems> get items => _todoStateController.stream;

  final _todoEventController = StreamController<TodoEvent>();
  Sink<TodoEvent> get todoEventSink => _todoEventController.sink;

  TodoBloc() {
    _todoEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TodoEvent event) {
    if (event is CheckEvent) {
      _list.items[event.todoItem.id].checked = event.todoItem.checked;
    } else if (event is AddTodoEvent) {
      _list.items.add(event.todoItem..id = getNewId());
    } else if (event is DeleteTodoEvent) {
      _list.items.removeWhere((element) => element.id == event.todoItem.id);
    }
    _inTodo.add(_list);
  }

  int getNewId() {
    if (_list.items.isEmpty) return 0;
    return _list.items.last.id + 1;
  }

  void dispose() {
    _todoStateController.close();
    _todoEventController.close();
  }
}
