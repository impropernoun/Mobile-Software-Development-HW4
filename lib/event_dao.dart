import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'event.dart';

@dao
abstract class EventDAO{
  @Query('SELECT * FROM Event')
  Stream<List<Event>> getAllEvent();

  @Query('SELECT * FROM Event WHERE id = :id')
  Future<Event?> getEvent(int id); // Stream<Event>

  @Query('DELETE FROM Event')
  Stream<void> deleteAllEvent();

  @insert
  Future<void> insertEvent(Event event);

  @update // TODO is this needed?
  Future<void> updateEvent(Event event);

  @delete
  Future<void> deleteEmployee(Event event);
}

