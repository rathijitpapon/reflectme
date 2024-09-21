// Implement the journal screen with the following features:
// - List of journal entries
// - A daily quote
// - today date, day of the week

import 'package:flutter/material.dart';
import 'package:reflectme/constants/calendar.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    return Column(
      children: [
        Text(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
          ),
          weekDays[date.weekday - 1]
        ),
        Text(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
          ),
          '${date.day} ${months[date.month - 1]}'
        ),
      ],
    );
  }
}