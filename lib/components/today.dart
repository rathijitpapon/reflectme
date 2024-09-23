import 'package:flutter/material.dart';
import 'package:reflectme/constants/calendar.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime date = DateTime.now();
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: weekDays[date.weekday - 1].toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade800,
              letterSpacing: 1.2,
            ),
          ),
          TextSpan(
            text: ', ${date.day} ${months[date.month - 1].toUpperCase()}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.indigo.shade700,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}