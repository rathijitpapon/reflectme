import 'package:flutter/material.dart';
import 'package:reflectme/components/segmented_control_button.dart';
import 'package:reflectme/screens/explore.dart';

class ExploreViewSegmentedControl extends StatelessWidget {
  const ExploreViewSegmentedControl({
    super.key,
    required this.selectedExploreView,
    required this.handleButtonPress,
  });

  final ExploreView selectedExploreView;
  final Function(ExploreView) handleButtonPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: ExploreView.values.map((view) => 
          SegmentedControlButton(
            isSelected: selectedExploreView == view,
            handleButtonPress: handleButtonPress,
            exploreView: view,
            itemCount: ExploreView.values.length,
          ),
        ).toList(),
      ),
    );
  }
}