import 'dart:async';

import 'package:ticker_app/bloc/ticker_event.dart';

import '../ticker.dart';

class TickerBloc {
  int _count = 0;
  Ticker _ticker = Ticker();

  final _stateController = StreamController<int>();
  Stream<int> get stateStream => _stateController.stream;

  final _eventController = StreamController<TickerEvent>();
  Sink<TickerEvent> get eventSink => _eventController.sink;

  TickerBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TickerEvent event) {
    if (event is TickerStartedEvent) {
      _count = 0;
      _ticker.tick().listen((event) {
        _stateController.sink.add(event);
      });
    } else if (event is TickerTickedEvent) {
      _count++;
      _stateController.sink.add(_count);
    }
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
