// Castel Villalobos
// event_create_form.dart
// 4/21/2023

import 'package:flutter/material.dart';
import 'event_view_model.dart';
import 'event.dart';
import 'package:intl/intl.dart';


bool isShowingList = false;

class EventCreateForm extends StatefulWidget {
  final OrderViewModel orderViewModel;
  const EventCreateForm({super.key, required this.orderViewModel});

  @override
  State<EventCreateForm> createState() => _EventCreateFormState();
}

class _EventCreateFormState extends State<EventCreateForm> {


  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController(text: null);
  final _descriptionController = TextEditingController(text: null);

  String? _title;
  String? _description;
  DateTime _startDay = DateTime.now();
  TimeOfDay _startTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  DateTime _endDay = DateTime.now();
  TimeOfDay _endTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  String? _validateTitle(String? title) {
    if(title == null || title.isEmpty) {
      return 'Please fill in a title.';
    }
    _title = title;
    return null;
  }

  String? _validateDescription(String? description) {
    if(description == null || description.isEmpty) {
      return 'Please fill in a description.';
      // TODO proper error message
    }
    _description = description;
    return null;
  }

  _submit() {
    _startDay = DateTime(_startDay.year, _startDay.month, _startDay.day, _startTime.hour, _startTime.minute);
    _endDay = DateTime(_endDay.year, _endDay.month, _endDay.day, _endTime.hour, _endTime.minute);

    if(_startDay.isAfter(_endDay) || _endDay.isBefore(_startDay)) {
      return 'Please enter valid dates.';
    }
    else{
      if(_formKey.currentState!.validate()) {
         var event = Event(
            _title!,
            _description!,
            _startDay,
            _startTime,
            _endDay,
            _endTime
        );

        widget.orderViewModel.addEvent(event);

        // TODO doesn't work, should go back to form page
         setState(() {
           isShowingList = false;
         });

         _formKey.currentState!.reset();
      }
    }
  }

  _selectStartDate() async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: _startDay,
        firstDate: DateTime(2023),
        lastDate: DateTime(2024)
    );

    if(datePicked != null) {
      setState(() {
        _startDay = datePicked;
      });
    }
  }

  _selectStartTime() async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if(timePicked != null) {
      setState(() {
        _startTime = timePicked;
      });
    }
  }


  _selectEndDate() async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: _endDay,
        firstDate: DateTime(2023),
        lastDate: DateTime(2024)
    );

    if(datePicked != null) {
      setState(() {
        _endDay = datePicked;
      });
    }
  }

  _selectEndTime() async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );

    if(timePicked != null) {
      setState(() {
        _endTime = timePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
          child:  Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  validator: _validateTitle,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Brief Description'),
                  controller: _descriptionController,
                  validator: _validateDescription,
                ),

                const Text('Start date'),
                OutlinedButton(
                  onPressed: () => _selectStartDate(),
                  child: Text(DateFormat.yMEd().format(_startDay)),
                ),
                const Text('Start time'),
                OutlinedButton(
                  onPressed: () => _selectStartTime(),
                  child: Text('${_startTime.hour}: ${_startTime.minute}'),
                ),

                const Text('End date'),
                OutlinedButton(
                    onPressed: () => _selectEndDate(),
                    child: Text(DateFormat.yMEd().format(_endDay))
                ),
                const Text('End time'),
                OutlinedButton(
                  onPressed: () => _selectEndTime(),
                  child: Text('${_endTime.hour}: ${_endTime.minute}'),
                ),

                 ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Create event')
                )
              ],
            )
        )
      )
    );

  }
}

