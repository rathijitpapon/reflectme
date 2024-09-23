import 'package:flutter/material.dart';
import 'package:reflectme/components/segmented_control_button.dart';

class SegmentedControl<T extends Enum> extends StatelessWidget {
  const SegmentedControl({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.onValueChanged,
    required this.iconMap,
  });

  final T selectedValue;
  final List<T> values;
  final Function(T) onValueChanged;
  final Map<T, IconData> iconMap;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5,
      runSpacing: 5,
      children: values.map((value) => 
        SegmentedControlButton(
          isSelected: selectedValue == value,
          onPress: onValueChanged,
          value: value,
          icon: iconMap[value]!,
        ),
      ).toList(),
    );
  }
}