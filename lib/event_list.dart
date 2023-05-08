// Castel Villalobos
// event_list.dart
// 5/7/2023

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event_view_model.dart';

class EventList extends StatelessWidget {
  final OrderViewModel orderViewModel;
  //     final orderViewModel = context.watch<OrderViewModel>();

  const EventList({super.key, required this.orderViewModel});

  _onDelete(int index) {
    orderViewModel.removeEvent(index);
  }

  // TODO edit tab, bring back to event maker page with all data saved?
  _onEdit(int index) {
    // jump to event_edit_form page
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
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('${titles[index]} '
                          '\n Start: ${DateFormat.yMEd().format(eventStarts[index])} '
                          '${DateFormat.jm().format(eventStarts[index])}'
                          '\n End: ${DateFormat.yMEd().format(eventEnds[index])} '
                          '${DateFormat.jm().format(eventEnds[index])}'
                          '\n Description: ${descriptions[index]}'
                      ),

                      // TODO make buttons smaller haha
                      trailing: SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              child: ElevatedButton(
                                onPressed: () { _onEdit(index); },
                                child: const Icon(Icons.edit_outlined),
                              ),
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                onPressed: () { _onDelete(index); },
                                child: const Icon(Icons.delete_forever),
                              ),
                            ),
                          ],
                        ),
                      )
                  )
              )
          );
        }
    );
  }
}