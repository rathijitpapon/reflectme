enum Mood {
  happy,
  sad,
  angry,
  excited,
  neutral,
  other,
}

class Location {
  final String placeName;
  final String address;
  final double latitude;
  final double longitude;

  Location({required this.placeName, required this.address, required this.latitude, required this.longitude});
}

enum JournalEntryType {
  prompt,
  moment,
}

class JournalEntry {
  final String id;
  final JournalEntryType entryType;
  final DateTime date;
  final String? prompt;
  final String? content;
  final List<String> imageUrls;
  final Mood? mood;
  final String? voiceNoteUrl;
  final int? heartRate;
  final int? steps; 
  final double? sleepHours;
  final Location? location;

  JournalEntry({
    required this.id,
    required this.entryType,
    required this.date,
    this.prompt,
    this.content,
    required this.imageUrls,
    required this.mood,
    this.voiceNoteUrl,
    this.heartRate,
    this.steps,
    this.sleepHours,
    this.location,
  });
}

final journalEntries = [
  JournalEntry(
    id: '1',
    entryType: JournalEntryType.moment,
    content: 'Today was a great day! I feel so happy and grateful for everything in my life. I spent the day with my friends and we had a lot of fun. I feel so happy and grateful for them.',
    date: DateTime.now(),
    imageUrls: [
      'https://www.incredibleindia.org/content/dam/incredible-india-v2/images/places/leh/leh-ladakh-leh-ladakh-zanskar-valley.jpg/jcr:content/renditions/cq5dam.web.1024.576.jpeg',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
      'https://fastly.picsum.photos/id/401/462/300.jpg?hmac=rj4LXgJM8BWN1JSInxVz9Hxu5SRQZlXgZ3JZwFavN44',
    ],
    mood: Mood.happy,
    voiceNoteUrl: 'https://soundcloud.com/fwmirror/random-voice-message-of-the?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing',
    heartRate: 70,
    steps: 10000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '2',
    entryType: JournalEntryType.moment,
    content: 'I had a really bad day today. I feel so sad and disappointed in myself.',
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.sad,
    heartRate: 70,
    steps: 100000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '3',
    entryType: JournalEntryType.moment,
    content: 'I spent the day with my friends and we had a lot of fun. I feel so happy and grateful for them.',
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.excited,
    heartRate: 70,
    steps: 10000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '4',
    entryType: JournalEntryType.prompt,
    date: DateTime.now(),
    prompt: 'What was the best thing that happened to you today?',
    content: 'I spent the day with my friends and we had a lot of fun. I feel so happy and grateful for them. I feel so happy and grateful for them.',
    imageUrls: [],
    mood: Mood.neutral,
    heartRate: 70,
    steps: 10000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '5',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [],
    mood: Mood.neutral,
    heartRate: 70,
    steps: 10000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '6',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.other,
  ),
  JournalEntry(
    id: '7',
    entryType: JournalEntryType.prompt,
    date: DateTime.now(),
    prompt: 'What was the best thing that happened to you today?',
    content: 'I spent the day with my friends and we had a lot of fun. I feel so happy and grateful for them. I feel so happy and grateful for them. Also, I am so happy and grateful for them. Can you believe it? Please be happy and grateful for them. Otherwise you will be sad and disappointed in yourself.',
    imageUrls: [],
    mood: Mood.neutral,
  ),
  JournalEntry(
    id: '8',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.other,
    heartRate: 70,
    steps: 10000,
    sleepHours: 7.5,
    location: Location(
      placeName: 'Zanskar Valley',
      address: 'Zanskar, Ladakh, India',
      latitude: 33.7362,
      longitude: 77.2962,
    ),
  ),
  JournalEntry(
    id: '9',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.other,
    heartRate: 70,
  ),
  JournalEntry(
    id: '9',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [],
    mood: Mood.other,
    heartRate: 70,
  ),
  JournalEntry(
    id: '10',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [],
    mood: Mood.other,
    heartRate: 70,
    sleepHours: 7.5,
  ),
  JournalEntry(
    id: '11',
    entryType: JournalEntryType.moment,
    date: DateTime.now(),
    imageUrls: [
      'https://fastly.picsum.photos/id/368/536/354.jpg?hmac=2b0UU6Y-8XxkiRBhatgBJ-ni3aWJ5CcVVENpX-mEiIA',
      'https://fastly.picsum.photos/id/699/536/354.jpg?hmac=LxV4my-lfpoTTliKKJsw-r1sJ1wkTRyeY_d1k7ZprYM',
    ],
    mood: Mood.other,
    heartRate: 70,
    steps: 10000,
  ),
];