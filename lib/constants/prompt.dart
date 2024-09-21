class Prompt {
  final String category;
  final List<String> prompts;

  Prompt({required this.category, required this.prompts});
}

final List<Prompt> prompts = [
  Prompt(
    category: 'Personal Growth',
    prompts: [
      'What is the most important thing I learned today?',
      'What are some things I am grateful for today?',
      'What are some things I can improve on?',
    ],
  ),
  Prompt(
    category: 'Gratitude',
    prompts: [
      'What are some things I am grateful for today?',
      'What are some things I can improve on?',
    ],
  ),
  Prompt(
    category: 'Self-reflection',
    prompts: [
      'What am I proud of myself for today?',
      'What are some things I can improve on?',
    ],
  ),
  Prompt(
    category: 'Future Planning',
    prompts: [
      'What are some things I want to achieve in the next 30 days?',
      'What are some things I can improve on?',
    ],
  ),
  Prompt(
    category: 'Mindfulness',
    prompts: [
      'What am I grateful for today?',
      'What are some things I can improve on?',
    ],
  ),
  Prompt(
    category: 'Health',
    prompts: [
      'What am I grateful for today?',
      'What are some things I can improve on?',
    ],
  ),
];