import 'package:flutter/material.dart';
import 'package:reflectme/components/daily_focus_widget.dart';
import 'package:reflectme/components/no_data_placeholder.dart';
import 'package:reflectme/components/quote_widget.dart';
import 'package:reflectme/components/today.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:reflectme/constants/quote.dart';
import 'package:reflectme/components/journal_entry_widget.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  List<DailyFocus> dailyFocuses = [];

  @override
  void initState() {
    super.initState();
    dailyFocuses = [
      DailyFocus(
        prompt: 'What are you grateful for today?',
        icon: Icons.lightbulb_outline,
        label: 'Gratitude'
      ),
      DailyFocus(
        prompt: 'What did you learn today?',
        icon: Icons.lightbulb_outline,
        label: 'Gratitude'
      ),
      DailyFocus(
        prompt: 'What are you looking forward to tomorrow?',
        icon: Icons.lightbulb_outline,
        label: 'Looking Forward'
      ),
      DailyFocus(
        prompt: 'What are you proud of today?',
        icon: Icons.lightbulb_outline,
        label: 'Gratitude'
      ),
      DailyFocus(
        prompt: 'What are you feeling right now?',
        icon: Icons.lightbulb_outline,
        label: 'Gratitude'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Today(),
        SizedBox(height: 10),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                QuoteView(quote: quotes[0]),
                SizedBox(height: 10),

                _buildSectionLabel(label: 'Daily Focus'),
                SizedBox(height: 10),
                ..._buildDailyFocus(),
                DailyFocusWidget(dailyFocus: dailyFocuses[0]),
                SizedBox(height: 20),

                _buildSectionLabel(label: 'Today\'s Moments'),
                SizedBox(height: 15),
                _buildJournalEntries(),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildJournalEntries() {
    if (journalEntries.isEmpty) {
      return NoDataPlaceholder(
        message: 'Your journal awaits!\nCapture your first moment now.',
        icon: Icons.edit_note,
      );
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: journalEntries.length,
      separatorBuilder: (context, index) => SizedBox(height: 25),
      itemBuilder: (context, index) {
        return JournalEntryWidget(journalEntry: journalEntries[index]);
      },
    );
  }

  List<Widget> _buildDailyFocus() {
    DateTime now = DateTime.now().toLocal();
    List<Widget> promptWidget = [];

    for (var element in scheduledFocuses) {
      if (element.startTime == null || element.endTime == null) {
        continue;
      }

      int currentMinutes = now.hour * 60 + now.minute;
      int startMinutes = element.startTime!.hour * 60 + element.startTime!.minute;
      int endMinutes = element.endTime!.hour * 60 + element.endTime!.minute;

      if (currentMinutes >= startMinutes && currentMinutes <= endMinutes) {
        promptWidget.add(DailyFocusWidget(dailyFocus: element));
        promptWidget.add(SizedBox(height: 10));
      }
    }

    return promptWidget;
  }

  Container _buildSectionLabel({required String label}) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }
}
