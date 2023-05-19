import 'package:floor/floor.dart';
import 'package:homework2/event_dao.dart';
import 'event.dart';


// Floor does not support DateTime or TimeOfDay (in event.dart),
// generator is unable to run and event.g.dart is unable to be created
// part 'event.g.dart';

@Database(version: 1, entities:[Event])
abstract class EventDatabase extends FloorDatabase {
  EventDAO get eventDAO;
}