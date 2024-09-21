import 'package:flutter/material.dart';
import 'package:reflectme/components/prompt_widget.dart';
import 'package:reflectme/components/quote_widget.dart';
import 'package:reflectme/components/explore_view_segmented_control.dart';
import 'package:reflectme/constants/prompt.dart';
import 'package:reflectme/constants/quote.dart';

enum ExploreView { prompts, quotes }

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ExploreView selectedExploreView = ExploreView.prompts;

  void handleButtonPress(ExploreView exploreView) {
    setState(() {
      selectedExploreView = exploreView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              ExploreViewSegmentedControl(
                selectedExploreView: selectedExploreView,
                handleButtonPress: handleButtonPress,
              ),
              SizedBox(height: 30),
              
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
                        screenSize: screenSize
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}