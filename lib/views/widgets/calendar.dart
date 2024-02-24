import 'package:flutter/material.dart';
import 'package:senior_design/views/screens/workoutdetails_view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<DateTime> workoutDays = [
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 4)),
    DateTime.now().add(const Duration(days: 3)),
  ];

  bool isWorkoutDay(DateTime day) {
    return workoutDays.any((workoutDay) =>
    day.year == workoutDay.year &&
        day.month == workoutDay.month &&
        day.day == workoutDay.day
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Calendar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.black),
                    ),
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: Colors.black),
                      defaultTextStyle: TextStyle(color: Colors.black),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        if (isWorkoutDay(day)) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              day.day.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        } else if (day == DateTime.now()) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              day.day.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (isWorkoutDay(selectedDay)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkoutDetailsView(selectedDay: selectedDay),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Selected day is not a workout day')));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
