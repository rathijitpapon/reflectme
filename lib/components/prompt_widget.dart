import 'package:flutter/material.dart';
import 'package:reflectme/constants/prompt.dart';
import 'package:reflectme/services/copy_text_to_clipboard.dart';

class ExplorePrompt extends StatelessWidget {
  const ExplorePrompt({
    super.key,
    required this.prompt,
    required this.screenSize,
  });

  final Prompt prompt;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          prompt.category.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 16),
        ...prompt.prompts.map((promptText) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            width: screenSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.secondaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: PromptText(
              promptText: promptText,
            ),
          ),
        )),
      ],
    );
  }
}

class PromptText extends StatelessWidget {
  const PromptText({
    super.key,
    required this.promptText,
  });

  final String promptText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => copyTextToClipboard(context, promptText),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            promptText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}