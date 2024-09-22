import 'package:flutter/material.dart';
import 'package:reflectme/constants/quote.dart';
import 'package:reflectme/services/copy_text_to_clipboard.dart';

class QuoteView extends StatelessWidget {
  final Quote quote;

  const QuoteView({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 15,
            child: Icon(
              Icons.format_quote,
              size: 30,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => copyTextToClipboard(context, '${quote.quote} - ${quote.author}'),
            child: QuoteText(quote: quote),
          ),
        ],
      ),
    );
  }
}

class QuoteText extends StatelessWidget {
  const QuoteText({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote.quote,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '- ${quote.author}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}