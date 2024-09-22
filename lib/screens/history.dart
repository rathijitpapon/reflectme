import 'package:flutter/material.dart';
import 'package:reflectme/components/date_range_picker.dart';
import 'package:reflectme/components/segmented_control.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:reflectme/components/journal_entry_widget.dart';
import 'package:reflectme/components/no_data_placeholder.dart';

enum HistoryView {
  recap,
  moments,
  focus,
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryView selectedHistoryView = HistoryView.moments;
  DateRangeOption initialDateRangeOption = DateRangeOption.last7Days;
  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now().subtract(Duration(days: 7)),
    end: DateTime.now(),
  );
  List<JournalEntry> moments = [];
  List<JournalEntry> reflections = [];
  List<JournalEntry> recaps = [];

  void handleDateRangeChange(DateTimeRange dateRange) {
    print('Date range changed to: $dateRange');
    setState(() {
      selectedDateRange = dateRange;
    });
  }

  void handleViewChange(HistoryView historyView) {
    setState(() {
      selectedHistoryView = historyView;
    });
  }

  @override
  void initState() {
    super.initState();
    moments = journalEntries.where((entry) => entry.entryType == JournalEntryType.moment).toList();
    reflections = journalEntries.where((entry) => entry.entryType == JournalEntryType.reflection).toList();
    recaps = journalEntries.where((entry) => entry.entryType == JournalEntryType.recap).toList();
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

        DateRangePicker(
          initialDateRange: selectedDateRange,
          initialDateRangeOption: initialDateRangeOption,
          onDateRangeChange: handleDateRangeChange,
        ),
        SizedBox(height: 15),

        if (selectedHistoryView == HistoryView.recap)
          _buildRecaps(),
        if (selectedHistoryView == HistoryView.moments)
          _buildMoments(),
        if (selectedHistoryView == HistoryView.focus)
          _buildReflections(),
      ],
    );
  }

  Widget _buildMoments() {
    if (moments.isEmpty) {
      return NoDataPlaceholder(
        message: 'Your journey awaits!\nCapture your first moment now.',
        icon: Icons.edit_note,
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: moments.length,
          separatorBuilder: (context, index) => SizedBox(height: 25),
          itemBuilder: (context, index) {
            return JournalEntryWidget(journalEntry: moments[index]);
          },
        ),
      );
    }
  }

  Widget _buildReflections() {
    if (reflections.isEmpty) {
      return NoDataPlaceholder(
        message: 'Your journey awaits!\nWrite your first reflection now.',
        icon: Icons.edit_note,
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: reflections.length,
          separatorBuilder: (context, index) => SizedBox(height: 25),
          itemBuilder: (context, index) {
            return JournalEntryWidget(journalEntry: reflections[index]);
          },
        ),
      );
    }
  }

  Widget _buildRecaps() {
    if (recaps.isEmpty) {
      return NoDataPlaceholder(
        message: 'Your recaps awaits!\nComplete writing about your first day.',
        icon: Icons.edit_note,
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: recaps.length,
          separatorBuilder: (context, index) => SizedBox(height: 25),
          itemBuilder: (context, index) {
            return JournalEntryWidget(journalEntry: recaps[index]);
          },
        ),
      );
    }
  }
}
