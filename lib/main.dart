// Castel Villalobos
// main.dart
// 5/18/2023

import 'package:flutter/material.dart';
import 'event_create_form.dart';
import 'event_view_model.dart';
import 'event_list.dart';
import 'event_database.dart';

// TODO LIST:
// No event edit function
// No events filter functionality
// Add page does not give success/failure messages

// ALSO TODO LIST:
// click on event to open details
//  - edit function will go here

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = await $FloorAppDatabase.databaseBuilder('edmt database.db').build();
//   final dao = database.eventDAO;
//
//     runApp(const MyApp());
//
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: const MyHomePage(title: "Event Tracker"),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isShowingList = true;

  final _orderViewModel = OrderViewModel();

  @override
  initState() {
    super.initState();

    _orderViewModel.addListener(_onEventAdded);
  }

  @override
  dispose() {
    super.dispose();

    _orderViewModel.removeListener(_onEventAdded);
  }

  _onEventAdded() {
    print('event form now has ${_orderViewModel.eventCount} events');
    setState(() {
      isShowingList = true;
    });
  }

  _onWalletTapped() {
    setState(() {
      isShowingList = true;
    });
  }

  // TODO filter function
  _onFilterTapped() {
    // only output event if(_endDay.isAfter(DateTime.now()))
  }

  _onAddTapped() {
    setState(() {
      isShowingList = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: isShowingList ? InkWell(
              onTap: _onAddTapped,
              child: Row(
                children: const [
                  Icon(Icons.add),
                ],
              )
          ) : null,

          title: const Text('Event Maker'),
          centerTitle: true,

          // TODO filter button should only appear when list is shown
          actions: [
            InkWell(
                onTap: _onFilterTapped,
                child: Row(
                  children: [
                    Icon(Icons.filter_alt_rounded),
                    AnimatedBuilder(
                        animation: _orderViewModel,
                        builder: (context, _) => const Text('')
                    )
                  ],
                )
            ),

            InkWell(
                onTap: _onWalletTapped,
                child: Row(
                  children: [
                    const Icon(Icons.account_balance_wallet), // all_inbox
                    AnimatedBuilder(
                        animation: _orderViewModel,
                        builder: (context, _) => Text('${_orderViewModel.eventCount}')
                    )
                  ],
                )
            ),
            const SizedBox(width: 4)
          ]
      ),
      body: Center(
          child: isShowingList
              ? EventList(orderViewModel: _orderViewModel)
              : EventCreateForm(orderViewModel: _orderViewModel)
      ),
    );
  }
}