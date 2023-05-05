// Castel Villalobos
// event_list.dart
// 4/21/2023

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event_view_model.dart';

class EventList extends StatelessWidget {
  final OrderViewModel orderViewModel;

  const EventList({super.key, required this.orderViewModel});

  _onDelete(int index) {
    orderViewModel.removeEvent(index);
  }

  _onEdit(int index) { // TODO
    // orderViewModel.removeEvent(index);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: orderViewModel,
      builder: (context, _) {
        final descriptions = orderViewModel.eventDescriptions;
        final titles = orderViewModel.eventTitles;
        final eventStarts = orderViewModel.eventStarts;
        final eventEnds = orderViewModel.eventEnds;

        return ListView.builder(
          itemCount: orderViewModel.eventCount,
          itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text('${titles[index]} '
                    '\n Start: ${DateFormat.yMEd().format(eventStarts[index])} '
                    '${DateFormat.jm().format(eventStarts[index])}'
                    '\n End: ${DateFormat.yMEd().format(eventEnds[index])} '
                    '${DateFormat.jm().format(eventEnds[index])}'
                    '\n Description: ${descriptions[index]}'
                ),
                // TODO add edit button and functionality
                trailing: ElevatedButton(
                  onPressed: () { _onDelete(index); },
                  child: const Icon(Icons.delete_forever),
                ),
              )
          )
        );
      }
    );
  }
}
