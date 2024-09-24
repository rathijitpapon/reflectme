import 'package:flutter/material.dart';
import 'package:reflectme/screens/editable_journal_entry.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.handleNavbarIndexChange,
  });

  final int selectedIndex;
  final Function(int) handleNavbarIndexChange;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double height = 90;
    const double actionButtonSize = 60;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height,
          width: size.width,
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE2E1F3), Color(0xFFD1DCFF)],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return index == 2 ? const SizedBox(width: actionButtonSize) : _buildNavItem(index);
                  }),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: 12, // Reduced from 12 to 8
                left: _getIndicatorPosition(size.width),
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10, // Changed from -20 to -15
          left: size.width / 2 - actionButtonSize / 2,
          child: _buildActionButton(actionButtonSize, context),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => handleNavbarIndexChange(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          _getIcon(index),
          color: isSelected ? Colors.indigo : Colors.indigo.withOpacity(0.5),
          size: isSelected ? 26 : 22,
        ),
      ),
    );
  }

  Widget _buildActionButton(double size, BuildContext context) {
    final bool isSelected = selectedIndex == 2;

    return GestureDetector(
      onTap: () => _showEditableJournal(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isSelected
                ? [Colors.indigo, Colors.indigoAccent]
                : [Colors.indigoAccent, Colors.indigo],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _showEditableJournal(context),
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.1),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: isSelected ? 34 : 30,
            ),
          ),
        ),
      ),
    );
  }

  void _showEditableJournal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return EditableJournalEntry();
      },
    );
  }

  double _getIndicatorPosition(double totalWidth) {
    final itemWidth = totalWidth / 5;
    final centerOfItem = itemWidth / 2 + 2.0;
    const dotWidth = 5.0;
    
    if (selectedIndex == 2) {
      return totalWidth / 2 - dotWidth / 2;
    }
    
    final basePosition = selectedIndex < 2
        ? (selectedIndex * itemWidth + centerOfItem)
        : ((selectedIndex + 1) * itemWidth - centerOfItem);
    
    final edgeOffset = itemWidth * 0.1; // 10% of item width for edge offset
    
    if (selectedIndex == 0) {
      return basePosition - dotWidth / 2 + edgeOffset;
    } else if (selectedIndex == 4) {
      return basePosition - dotWidth / 2 - edgeOffset;
    } else {
      return basePosition - dotWidth / 2;
    }
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.wb_sunny;
      case 1:
        return Icons.history_edu;
      case 2:
        return Icons.add;
      case 3:
        return Icons.insights;
      case 4:
        return Icons.travel_explore;
      default:
        return Icons.error;
    }
  }
}