import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateRangeOption {
  today,
  yesterday,
  last7Days,
  last14Days,
  allTimes,
  customRange,
}

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({
    super.key,
    required this.onDateRangeChange,
    required this.initialDateRangeOption,
    required this.initialDateRange,
  });

  final Function(DateTimeRange) onDateRangeChange;
  final DateTimeRange initialDateRange;
  final DateRangeOption initialDateRangeOption;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateRangeOption _selectedOption = DateRangeOption.customRange;
  DateTimeRange _dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialDateRangeOption;
    _dateRange = widget.initialDateRange;
  }

  void handleDateRangeChange(DateTimeRange dateRange) {
    widget.onDateRangeChange(dateRange);
    setState(() {
      _dateRange = dateRange;
    });
  }

  void handleOptionChange(DateRangeOption? newValue) {
    if (newValue == null) return;
    widget.onDateRangeChange(_getDateRangeForOption(newValue));
    setState(() {
      _selectedOption = newValue;
      _dateRange = _getDateRangeForOption(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        width: _selectedOption == DateRangeOption.customRange ? 240 : 180,
        height: _selectedOption == DateRangeOption.customRange ? 100 : 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDateOptionDropDown(),
            if (_selectedOption == DateRangeOption.customRange)
              TextButton(
                onPressed: _selectDateRange,
                child: Text(
                  '${DateFormat('MMM d, yyyy').format(_dateRange.start)} - ${DateFormat('MMM d, yyyy').format(_dateRange.end)}',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateOptionDropDown() {
    return PopupMenuButton<DateRangeOption>(
      initialValue: _selectedOption,
      onSelected: handleOptionChange,
      itemBuilder: (BuildContext context) {
        return DateRangeOption.values.map((DateRangeOption option) {
          return PopupMenuItem<DateRangeOption>(
            value: option,
            child: Text(_getOptionText(option)),
          );
        }).toList();
      },
      offset: const Offset(0, 25),
      constraints: BoxConstraints(
        minWidth: _selectedOption == DateRangeOption.customRange ? 260 : 200,
        maxWidth: _selectedOption == DateRangeOption.customRange ? 260 : 200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_getOptionText(_selectedOption)),
          SizedBox(width: 15),
          const Icon(Icons.calendar_month),
        ],
      ),
    );
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: _dateRange,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).primaryColor,
            colorScheme: ColorScheme.light(primary: Theme.of(context).primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      // Add these new parameters
      currentDate: DateTime.now(),
      helpText: 'Select Date Range',
      cancelText: 'Cancel',
      confirmText: 'Confirm',
      saveText: 'Save',
      errorFormatText: 'Invalid format.',
      errorInvalidText: 'Invalid range.',
      errorInvalidRangeText: 'Invalid range.',
      fieldStartHintText: 'Start Date',
      fieldEndHintText: 'End Date',
    );
    if (picked != null) {
      setState(() {
        _dateRange = picked;
      });
      handleDateRangeChange(picked);
    }
  }

  String _getOptionText(DateRangeOption option) {
    switch (option) {
      case DateRangeOption.today:
        return 'Today';
      case DateRangeOption.yesterday:
        return 'Yesterday';
      case DateRangeOption.last7Days:
        return 'Last 7 Days';
      case DateRangeOption.last14Days:
        return 'Last 14 Days';
      case DateRangeOption.allTimes:
        return 'All Times';
      case DateRangeOption.customRange:
        return 'Custom Range';
    }
  }

  DateTimeRange _getDateRangeForOption(DateRangeOption option) {
    final now = DateTime.now();
    switch (option) {
      case DateRangeOption.last7Days:
        return DateTimeRange(start: now.subtract(Duration(days: 7)), end: now);
      case DateRangeOption.last14Days:
        return DateTimeRange(start: now.subtract(Duration(days: 14)), end: now);
      case DateRangeOption.yesterday:
        final yesterday = now.subtract(Duration(days: 1));
        return DateTimeRange(start: yesterday, end: yesterday);
      case DateRangeOption.today:
        return DateTimeRange(start: now, end: now);
      case DateRangeOption.allTimes:
        return DateTimeRange(start: DateTime(2000), end: DateTime.now());
      case DateRangeOption.customRange:
        return _dateRange;
    }
  }
}