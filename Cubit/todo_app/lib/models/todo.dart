class Todo {
  final int id;
  final String item;
  final bool isDone;

  Todo({this.id = -1, required this.item, this.isDone = false});

  factory Todo.copyWith(Todo todo, {int? id, String? item, bool? isDone}) {
    return Todo(
        id: id ?? todo.id,
        item: item ?? todo.item,
        isDone: isDone ?? todo.isDone);
  }
  factory Todo.check(Todo todo) {
    return Todo.copyWith(todo, isDone: !todo.isDone);
  }
}
