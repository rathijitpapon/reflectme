import 'package:flutter/material.dart';

class EditableJournalEntry extends StatefulWidget {
  const EditableJournalEntry({super.key});

  @override
  EditableJournalEntryState createState() => EditableJournalEntryState();
}

class EditableJournalEntryState extends State<EditableJournalEntry> {
  final TextEditingController _textController = TextEditingController();
  double _steps = 0;
  double _sleepHours = 0;
  double _heartRate = 60;
  double _moodValue = 2;
  final List<String> _moodEmojis = ['😢', '😐', '😊', '😄', '🥳'];
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildCloseButton(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPrompt(),
                      SizedBox(height: 16),
                      _buildJournalTextField(),
                      SizedBox(height: 16),
                      _buildMediaOptions(),
                      SizedBox(height: 16),
                      _buildHealthCard(),
                      SizedBox(height: 16),
                      _buildMoodSelector(),
                      SizedBox(height: 24),
                      _buildSaveButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  Widget _buildPrompt() {
    return Text(
      "What's the most interesting thing that happened today?",
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildJournalTextField() {
    return TextField(
      controller: _textController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Write your journal entry here...',
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: 18),
    );
  }

  Widget _buildMediaOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            print('Add Image');
          },
          icon: Icon(Icons.image),
          label: Text('Add Image'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            print('Add Audio');
          },
          child: Icon(Icons.mic),
        ),
        if (isRecording)
          ElevatedButton(
            child: Text('Stop Recording'),
            onPressed: () async {
              print('Stop Recording');
            },
          ),
      ],
    );
  }

  Widget _buildHealthCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Health Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildHealthSlider(Icons.directions_walk, 'Steps', _steps, 0, 20000, (value) => setState(() => _steps = value)),
            _buildHealthSlider(Icons.bedtime, 'Sleep (hours)', _sleepHours, 0, 12, (value) => setState(() => _sleepHours = value)),
            _buildHealthSlider(Icons.favorite, 'Heart Rate (bpm)', _heartRate, 40, 200, (value) => setState(() => _heartRate = value)),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthSlider(IconData icon, String label, double value, double min, double max, Function(double) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.blue),
              SizedBox(width: 16),
              Text(label, style: TextStyle(fontSize: 16)),
              Spacer(),
              Text(value.toStringAsFixed(1), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: (max - min).toInt(),
            label: value.round().toString(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildMoodSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('How are you feeling?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Row(
          children: [
            Text(_moodEmojis[_moodValue.floor()], style: TextStyle(fontSize: 32)),
            SizedBox(width: 16),
            Expanded(
              child: Slider(
                value: _moodValue,
                min: 0,
                max: 4,
                divisions: 4,
                label: _moodEmojis[_moodValue.round()],
                onChanged: (value) {
                  setState(() => _moodValue = value);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _saveEntry,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text('Save Entry', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  void _saveEntry() {
    print('Saving entry: ${_textController.text}');
    print('Selected mood: ${_moodEmojis[_moodValue.round()]}');
    print('Steps: ${_steps.round()}');
    print('Sleep hours: ${_sleepHours.toStringAsFixed(1)}');
    print('Heart rate: ${_heartRate.round()}');
    _textController.clear();
    setState(() {
      _moodValue = 2;
      _steps = 0;
      _sleepHours = 0;
      _heartRate = 60;
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
