import 'package:flutter/material.dart';
import 'package:reflectme/components/no_data_placeholder.dart';
import 'package:reflectme/components/prompt_widget.dart';
import 'package:reflectme/components/quote_widget.dart';
import 'package:reflectme/components/segmented_control.dart';
import 'package:reflectme/constants/prompt.dart';
import 'package:reflectme/constants/quote.dart';

enum ExploreView { insights, prompts, quotes }

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreView selectedExploreView = ExploreView.insights;

  void handleViewChange(ExploreView exploreView) {
    setState(() {
      selectedExploreView = exploreView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SegmentedControl<ExploreView>(
          selectedValue: selectedExploreView,
          values: ExploreView.values,
          onValueChanged: handleViewChange,
          iconMap: {
            ExploreView.insights: Icons.insights,
            ExploreView.prompts: Icons.question_answer,
            ExploreView.quotes: Icons.format_quote,
          },
        ),
        SizedBox(height: 30),

        if (selectedExploreView == ExploreView.insights)
          Expanded(
            child: NoDataPlaceholder(
              message: 'Your insights await!\nCapture your first moment now.',
              icon: Icons.insights,
            ),
          ),
        
        if (selectedExploreView == ExploreView.prompts)
          Expanded(
            child: ListView.separated(
              itemCount: prompts.length,
              separatorBuilder: (context, index) => SizedBox(height: 20), // Add space between items
              itemBuilder: (context, index) {
                final prompt = prompts[index];
                return ExplorePrompt(
                  prompt: prompt,
                  screenSize: screenSize
                );
              },
            ),
          ),
    
        if (selectedExploreView == ExploreView.quotes)
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];
                return QuoteView(
                  quote: quote,
                );
              },
            ),
          ),
      ],
    );
  }
}