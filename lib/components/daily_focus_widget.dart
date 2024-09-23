import 'package:flutter/material.dart';
import 'package:reflectme/constants/journal.dart';

class DailyFocusWidget extends StatelessWidget {
  const DailyFocusWidget({
    super.key,
    required this.dailyFocus,
  });

  final DailyFocus dailyFocus;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Colors.grey[250],
        child: Column(
          children: [
            Icon(
              dailyFocus.icon,
              color: Colors.deepPurple.shade500,
              size: 28,
            ),
            SizedBox(height: 15),

            Text(
              dailyFocus.prompt,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.indigo.shade900,
                letterSpacing: 0.5,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            Text(
              dailyFocus.label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.indigo.shade600,
                letterSpacing: 0.5,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
