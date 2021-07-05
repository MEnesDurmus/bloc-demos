class TodoItem {
  int id;
  String text;
  bool checked;

  TodoItem(
    this.text, {
    this.id = -1,
    this.checked = false,
  });
}

TodoItem defaultItem = TodoItem("default text");
