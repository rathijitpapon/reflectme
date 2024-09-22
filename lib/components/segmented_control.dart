import 'package:flutter/material.dart';
import 'package:reflectme/components/segmented_control_button.dart';

class SegmentedControl<T extends Enum> extends StatelessWidget {
  const SegmentedControl({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.onValueChanged,
  });

  final T selectedValue;
  final List<T> values;
  final Function(T) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: values.map((value) => 
          SegmentedControlButton(
            isSelected: selectedValue == value,
            onPress: onValueChanged,
            value: value,
            itemCount: values.length,
          ),
        ).toList(),
      ),
    );
  }
}