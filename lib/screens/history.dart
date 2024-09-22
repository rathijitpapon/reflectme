import 'package:flutter/material.dart';
import 'package:reflectme/components/segmented_control.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:reflectme/components/journal_entry_widget.dart';
import 'package:reflectme/components/no_data_placeholder.dart';

enum HistoryView {
  summary,
  history,
  reflection,
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryView selectedHistoryView = HistoryView.history;

  void handleViewChange(HistoryView historyView) {
    setState(() {
      selectedHistoryView = historyView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedControl<HistoryView>(
          selectedValue: selectedHistoryView,
          values: HistoryView.values,
          onValueChanged: handleViewChange,
        ),
        SizedBox(height: 20),

        if (selectedHistoryView == HistoryView.history)
          _buildHistoryView(),
        if (selectedHistoryView == HistoryView.reflection)
          _buildReflectionView(),
        if (selectedHistoryView == HistoryView.summary)
          _buildSummaryView(),
      ],
    );
  }

  Widget _buildHistoryView() {
    if (journalEntries.isEmpty) {
      return NoDataPlaceholder(
        message: 'Your journey awaits!\nCapture your first moment now.',
        icon: Icons.edit_note,
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: journalEntries.length,
          separatorBuilder: (context, index) => SizedBox(height: 25),
          itemBuilder: (context, index) {
            return JournalEntryWidget(journalEntry: journalEntries[index]);
          },
        ),
      );
    }
  }

  Widget _buildReflectionView() {
    return NoDataPlaceholder(
      message: 'Your reflections await!\nCapture your first moment now.',
      icon: Icons.edit_note,
    );
  }

  Widget _buildSummaryView() {
    return NoDataPlaceholder(
      message: 'Your summary awaits!\nCapture your first moment now.',
      icon: Icons.edit_note,
    );
  }
}
