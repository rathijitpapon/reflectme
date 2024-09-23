import 'package:flutter/material.dart';

class SegmentedControlButton<T extends Enum> extends StatelessWidget {
  const SegmentedControlButton({
    super.key,
    required this.isSelected,
    required this.onPress,
    required this.value,
    required this.icon,
  });

  final bool isSelected;
  final Function(T) onPress;
  final T value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(value),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey[300],
        child: SizedBox(
          width: 100,
          height: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 4),
              Text(
                value.name[0].toUpperCase() + value.name.substring(1),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}