import 'package:flutter/material.dart';
import 'package:reflectme/components/no_data_placeholder.dart';

class InsightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoDataPlaceholder(
      message: 'Your insights await!\nCapture your first moment now.',
      icon: Icons.insights,
    );
  }
}
