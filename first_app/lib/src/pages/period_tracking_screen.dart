// TODO Implement this library.// period_tracking_screen.dart
import 'package:flutter/material.dart';

class PeriodTrackingScreen extends StatefulWidget {
  const PeriodTrackingScreen({Key? key}) : super(key: key);

  @override
  _PeriodTrackingScreenState createState() => _PeriodTrackingScreenState();
}

class _PeriodTrackingScreenState extends State<PeriodTrackingScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    // Initialize with the current date
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Period Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendar to mark the start of the period cycle
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Start Date'),
            ),
            const SizedBox(height: 16.0),
            Text('Selected Date: ${selectedDate.toLocal()}'),

            // Input fields for average period length and cycle length
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Average Period Length',
                hintText: 'Enter average period length (24-38 days)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Average Cycle Length',
                hintText: 'Enter average cycle length (5-7 days)',
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16.0),

            // Button to show prediction
            ElevatedButton(
              onPressed: () => _showPrediction(),
              child: const Text('Show Prediction'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
     if (picked != selectedDate) 
      setState(() {
        selectedDate = picked;
      });
  }

  void _showPrediction() {
    // Add logic to calculate and display the prediction based on the input values
    // You can use the selectedDate, average period length, and average cycle length for calculations
    // Display the result using a dialog or another UI element
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Prediction'),
          content: const Text('Next cycle in \n 5  days '),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
