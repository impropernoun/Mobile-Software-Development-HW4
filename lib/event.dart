// Castel Villalobos
// event.dart
// 5/7/2023

import 'package:flutter/material.dart';

class Event {
  String title;
  String description;
  DateTime startDay;
  TimeOfDay startTime;
  DateTime endDay;
  TimeOfDay endTime;

  Event(this.title, this.description, this.startDay, this.startTime, this.endDay, this.endTime);

  @override
  String toString() {
    return 'Event{title: $title, description: $description, '
        'startDay: $startDay, startTime: $startTime, endDay: $endDay, endTime: $endTime}';
  }
}
