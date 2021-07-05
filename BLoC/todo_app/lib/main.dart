import 'package:flutter/material.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/methods/build_bottom_sheet.dart';
import 'package:todo_app/widgets/custom_container.dart';
import 'package:todo_app/model/todo_item.dart';

import 'model/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)))),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = TodoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: StreamBuilder<TodoItems>(
            stream: _bloc.items,
            initialData: initialData,
            builder: (context, snapshot) {
              if (snapshot.data!.items.isNotEmpty)
                return ListView.builder(
                    itemCount: snapshot.data?.items.length,
                    itemBuilder: (context, index) {
                      return CustomContainer(
                          snapshot.data?.items[index] ?? defaultItem, _bloc);
                    });
              else
                return Center(child: Text('There is nothing todo.'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => buildBottomSheet(context, _bloc));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
