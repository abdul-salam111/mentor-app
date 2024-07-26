import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TimePickerExample(),
  ));
}

class TimePickerExample extends StatefulWidget {
  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<TimePickerExample> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 1, minute: 20),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  String? _validateTime(TimeOfDay? time) {
    if (time == null) {
      return 'Please select a time';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _selectTime(context, true),
                child: Text(_startTime == null
                    ? 'Select Start Time'
                    : 'Start Time: ${_startTime!.format(context)}'),
              ),
              ElevatedButton(
                onPressed: () => _selectTime(context, false),
                child: Text(_endTime == null
                    ? 'Select End Time'
                    : 'End Time: ${_endTime!.format(context)}'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Do something with the selected times
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Times are valid')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
              if (_startTime == null) Text('Please select a start time', style: TextStyle(color: Colors.red)),
              if (_endTime == null) Text('Please select an end time', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
