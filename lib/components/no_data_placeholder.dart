import 'package:flutter/material.dart';

class NoDataPlaceholder extends StatelessWidget {
  final String message;
  final IconData icon;
  final double? iconSize;
  final double? fontSize;

  const NoDataPlaceholder({
    super.key,
    required this.message,
    required this.icon,
    this.iconSize = 48.0,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}