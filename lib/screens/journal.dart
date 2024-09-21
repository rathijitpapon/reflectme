// Implement the journal screen with the following features:
// - List of journal entries
// - A daily quote
// - today date, day of the week

import 'package:flutter/material.dart';
import 'package:reflectme/components/quote_widget.dart';
import 'package:reflectme/components/today.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:reflectme/constants/quote.dart';
import 'package:reflectme/components/journal_entry_widget.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              Today(),
              SizedBox(height: 10),

              QuoteView(
                quote: Quote(
                  quote: quotes[0].quote,
                  author: quotes[0].author,
                ),
                screenSize: screenSize,
              ),
              SizedBox(height: 20),

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
          ),
        ),
      ),
    );
  }
}
