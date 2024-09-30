import 'package:flutter/material.dart';
import 'package:reflectme/components/no_data_placeholder.dart';

class CopilotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoDataPlaceholder(
      message: 'Your mental health coach is coming soon!',
      icon: Icons.upcoming,
    );
  }
}
