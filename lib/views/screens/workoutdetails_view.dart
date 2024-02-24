import 'package:flutter/material.dart';

class WorkoutDetailsView extends StatelessWidget {
  final DateTime selectedDay;

  const WorkoutDetailsView({Key? key, required this.selectedDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Details'),
      ),
      body: Center(
        child: Text('Workout details for ${selectedDay.toString()}'),
      ),
    );
  }
}
