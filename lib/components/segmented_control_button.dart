import 'dart:math';
import 'package:flutter/material.dart';

class SegmentedControlButton<T extends Enum> extends StatelessWidget {
  const SegmentedControlButton({
    super.key,
    required this.isSelected,
    required this.onPress,
    required this.value,
    required this.itemCount,
  });

  final bool isSelected;
  final Function(T) onPress;
  final T value;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size(max(size.width / (itemCount + 0.8), 100), 50),
        backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey[300],
        foregroundColor: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
      ),
      onPressed: () => onPress(value),
      child: Text(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        value.name[0].toUpperCase() + value.name.substring(1)
      ),
    );
  }
}