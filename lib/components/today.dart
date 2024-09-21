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
          weekDays[date.weekday - 1].toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade700,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${date.day} ${months[date.month - 1].toUpperCase()}',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade900,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}