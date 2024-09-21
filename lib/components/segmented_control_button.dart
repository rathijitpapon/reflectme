import 'package:flutter/material.dart';
import 'package:reflectme/screens/explore.dart';

class SegmentedControlButton extends StatelessWidget {
  const SegmentedControlButton({
    super.key,
    required this.isSelected,
    required this.handleButtonPress,
    required this.exploreView,
    required this.itemCount,
  });

  final bool isSelected;
  final Function(ExploreView) handleButtonPress;
  final ExploreView exploreView;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size(size.width / (itemCount + 1), 60),
        backgroundColor: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey[300],
        foregroundColor: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.primary,
      ),
      onPressed: () => handleButtonPress(exploreView),
      child: Text(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        exploreView.name[0].toUpperCase() + exploreView.name.substring(1)
      ),
    );
  }
}