// Castel Villalobos
// event_view_model.dart
// 5/18/2023

import 'package:flutter/widgets.dart';
import 'event.dart';

class OrderViewModel extends ChangeNotifier {
  final List<Event> _events = [];

  void addEvent(Event event) {
    print('adding $event to $_events');
    _events.add(event);
    notifyListeners();
  }

  void removeEvent(int index) {
    _events.removeAt(index);
    notifyListeners();
  }

  int get eventCount => _events.length;

  List<String> get eventTitles =>
      _events.map(
              (event) => event.title
      ).toList();

  List<String> get eventDescriptions =>
      _events.map(
              (event) => event.description
      ).toList();

  List<DateTime> get eventStarts =>
      _events.map(
              (event) =>
              DateTime(
                  DateTime.parse(event.startDay).year, DateTime.parse(event.startDay).month, DateTime.parse(event.startDay).day,
                  event.startTime.hour, event.startTime.minute)
      ).toList();

  List<DateTime> get eventEnds =>
      _events.map(
              (event) =>
              DateTime(DateTime.parse(event.endDay).year, DateTime.parse(event.endDay).month, DateTime.parse(event.endDay).day,
                  event.endTime.hour, event.endTime.minute)
      ).toList();
}
