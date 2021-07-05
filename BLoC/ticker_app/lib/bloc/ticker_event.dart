import 'package:ticker_app/ticker.dart';

abstract class TickerEvent {}

class TickerStartedEvent extends TickerEvent {}

class TickerTickedEvent extends TickerEvent {}
