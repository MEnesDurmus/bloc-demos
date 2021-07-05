import 'package:flutter/material.dart';
import 'package:ticker_app/bloc/ticker_bloc.dart';

import 'bloc/ticker_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _bloc = TickerBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ticker App"),
        ),
        body: Center(
            child: StreamBuilder(
                stream: _bloc.stateStream,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Text(
                      "${snapshot.data}",
                      style: Theme.of(context).textTheme.headline5,
                    );
                  else
                    return Text(
                      "Text",
                      style: Theme.of(context).textTheme.headline5,
                    );
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _bloc.eventSink.add(TickerStartedEvent());
          },
          child: Icon(Icons.timer),
        ),
      ),
    );
  }
}
