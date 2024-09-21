import 'package:flutter/material.dart';
import 'package:reflectme/components/check_in_card.dart';
import 'package:reflectme/components/journal_image_carousel.dart';
import 'package:reflectme/components/plus_x_check_in_card.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:intl/intl.dart';

class JournalEntryWidget extends StatelessWidget {
  const JournalEntryWidget({super.key, required this.journalEntry});

  final JournalEntry journalEntry;

  @override
  Widget build(BuildContext context) {
    final checkInCards = _buildCheckInCards();
    final imageHeight = _calculateImageHeight(checkInCards);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.zero,
      child: Container(
        decoration: _buildCardDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPromptSection(context),
              _buildCheckInSection(context, checkInCards),
              if (journalEntry.imageUrls.isNotEmpty)
                _buildImageSection(context, imageHeight, checkInCards),
              _buildContentSection(context, checkInCards),
              _buildDateTimeSection(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCheckInCards() {
    final checkInCards = <Widget>[];
    if (journalEntry.location != null) {
      checkInCards.add(CheckInCard(icon: Icons.location_pin, title: 'Location', value: '${journalEntry.location?.placeName}'));
    }
    if (journalEntry.steps != null) {
      checkInCards.add(CheckInCard(icon: Icons.directions_walk, title: 'Walk', value: '${journalEntry.steps} Steps'));
    }
    if (journalEntry.heartRate != null) {
      checkInCards.add(CheckInCard(icon: Icons.heart_broken, title: 'Heart Rate', value: '${journalEntry.heartRate} BPM'));
    }
    if (journalEntry.sleepHours != null) {
      checkInCards.add(CheckInCard(icon: Icons.bedtime, title: 'Sleep', value: '${journalEntry.sleepHours} Hours'));
    }
    return checkInCards;
  }

  double _calculateImageHeight(List<Widget> checkInCards) {
    if (checkInCards.isEmpty && (journalEntry.content?.isEmpty ?? true)) {
      return 200.0;
    } else if (checkInCards.length > 2) {
      return 160.0;
    }
    return 150.0;
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)],
      ),
    );
  }

  Widget _buildCheckInSection(BuildContext context, List<Widget> checkInCards) {
    if (journalEntry.imageUrls.isNotEmpty || checkInCards.isEmpty) return SizedBox.shrink();
    
    return Column(
      children: [
        if (checkInCards.length == 1)
          SizedBox(
            width: (MediaQuery.of(context).size.width - 60) / 2,
            child: checkInCards[0],
          )
        else
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ...checkInCards.take(3),
              if (checkInCards.length > 3)
                PlusXCheckInCard(xValue: checkInCards.length - 3)
            ],
          ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context, double imageHeight, List<Widget> checkInCards) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: JournalImageCarousel(imageHeight: imageHeight, imageUrls: journalEntry.imageUrls),
            ),
            if (checkInCards.isNotEmpty) ...[
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    checkInCards[0],
                    if (checkInCards.length > 1) ...[
                      const SizedBox(height: 8),
                      checkInCards[1],
                    ],
                    if (checkInCards.length > 2) ...[
                      const SizedBox(height: 8),
                      PlusXCheckInCard(xValue: checkInCards.length - 2),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPromptSection(BuildContext context) {
    if (journalEntry.prompt?.isEmpty ?? true) return SizedBox.shrink();

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.lightbulb_outline, color: Colors.amber[800], size: 22),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                journalEntry.prompt!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.teal[900],
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  letterSpacing: 0.3,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context, List<Widget> checkInCards) {
    if (journalEntry.content?.isEmpty ?? true) return SizedBox.shrink();
    
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.edit_note, color: Colors.indigo[400], size: 22),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                journalEntry.content!,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.blueGrey[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0.3,
                  height: 1.4,
                ),
                maxLines: (journalEntry.imageUrls.isEmpty && checkInCards.isEmpty) ? 6 : 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateTimeSection(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        '${DateFormat('EEEE, MMMM d').format(journalEntry.date)} • ${DateFormat('h:mm a').format(journalEntry.date)}',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.indigo[700],
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}