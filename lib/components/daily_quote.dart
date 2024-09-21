import 'package:flutter/material.dart';

class DailyQuote extends StatelessWidget {
  const DailyQuote({
    super.key,
    required this.quote,
    required this.author,
  });

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Icon(Icons.format_quote),
            ),
            Text(quote),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Text(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic,
                ),
                author
              ),
            ),
          ],
        ),
      ),
    );
  }
}