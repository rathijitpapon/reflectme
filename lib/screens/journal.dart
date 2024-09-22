import 'package:flutter/material.dart';
import 'package:reflectme/components/no_data_placeholder.dart';
import 'package:reflectme/components/quote_widget.dart';
import 'package:reflectme/components/today.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:reflectme/constants/quote.dart';
import 'package:reflectme/components/journal_entry_widget.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Today(),
        SizedBox(height: 5),

        QuoteView(
          quote: Quote(
            quote: quotes[0].quote,
            author: quotes[0].author,
          ),
        ),
        SizedBox(height: 15),

        if (journalEntries.isEmpty)
          NoDataPlaceholder(
            message: 'Your journal await!\nCapture your first moment now.',
            icon: Icons.edit_note,
          )
        else
          Expanded(
            child: ListView.separated(
              itemCount: journalEntries.length,
              separatorBuilder: (context, index) => SizedBox(height: 25),
              itemBuilder: (context, index) {
                return JournalEntryWidget(journalEntry: journalEntries[index]);
              },
            ),
          ),
      ],
    );
  }
}
