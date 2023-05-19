// Castel Villalobos
// event.dart
// 5/18/2023

import 'package:flutter/material.dart';
import 'package:floor/floor.dart';

@entity
class Event {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String title;
  String description;

  String startDay; // Floor does not support DateTime, unable to run generator
  TimeOfDay startTime;
  String endDay;
  TimeOfDay endTime;

  Event(this.id, this.title, this.description, this.startDay, this.startTime, this.endDay, this.endTime);

  @override
  String toString() {
    return 'Event{title: $title, description: $description, '
        'startDay: $startDay, startTime: $startTime, endDay: $endDay, endTime: $endTime}';
  }
}
