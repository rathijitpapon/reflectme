import 'package:flutter/material.dart';
import 'package:reflectme/components/check_in_card.dart';
import 'package:reflectme/components/journal_image_carousel.dart';
import 'package:reflectme/components/plus_x_check_in_card.dart';
import 'package:reflectme/constants/journal.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class JournalEntryWidget extends StatefulWidget {
  const JournalEntryWidget({
    super.key,
    required this.journalEntry,
  });

  final JournalEntry journalEntry;

  @override
  JournalEntryWidgetState createState() => JournalEntryWidgetState();
}

class JournalEntryWidgetState extends State<JournalEntryWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  static const cardPadding = 10.0;
  var checkInCards = <Widget>[];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void buildCheckInCards() {
    if (widget.journalEntry.location != null) {
      checkInCards.add(CheckInCard(icon: Icons.location_pin, title: 'Location', value: '${widget.journalEntry.location?.placeName}'));
    }
    if (widget.journalEntry.steps != null) {
      checkInCards.add(CheckInCard(icon: Icons.directions_walk, title: 'Walk', value: '${widget.journalEntry.steps} Steps'));
    }
    if (widget.journalEntry.heartRate != null) {
      checkInCards.add(CheckInCard(icon: Icons.heart_broken, title: 'Heart Rate', value: '${widget.journalEntry.heartRate} BPM'));
    }
    if (widget.journalEntry.sleepHours != null) {
      checkInCards.add(CheckInCard(icon: Icons.bedtime, title: 'Sleep', value: '${widget.journalEntry.sleepHours} Hours'));
    }
  }

  @override
  Widget build(BuildContext context) {
    buildCheckInCards();
    var imageHeight = 150.0;
    if (
      checkInCards.isEmpty &&
      (widget.journalEntry.content == null || widget.journalEntry.content!.isEmpty)
    ) {
      imageHeight = 200.0;
    } else if (checkInCards.length > 2) {
      imageHeight = 160.0;
    }


    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE0F2F1),  // Pale cyan
              Color(0xFFB2DFDB),  // Light teal
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.journalEntry.imageUrls.isEmpty && checkInCards.isNotEmpty) ...[
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    ...checkInCards.take(3),
                    if (checkInCards.length > 3) ...[
                      PlusXCheckInCard(xValue: checkInCards.length - 3)
                    ]
                  ],
                ),
                SizedBox(height: 16),
              ],

              if (widget.journalEntry.imageUrls.isNotEmpty) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: JournalImageCarousel(imageHeight: imageHeight, imageUrls: widget.journalEntry.imageUrls),
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

              if (widget.journalEntry.content != null && widget.journalEntry.content!.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20 - cardPadding,
                  ),
                  child: Text(
                    widget.journalEntry.content ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.3,
                      height: 1.4,
                    ),
                    maxLines: (widget.journalEntry.imageUrls.isEmpty && checkInCards.isEmpty) ? 6 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 16),
              ],
              
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '${DateFormat('EEEE, MMMM d').format(widget.journalEntry.date)} • ${DateFormat('h:mm a').format(widget.journalEntry.date)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.indigo[700],
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}