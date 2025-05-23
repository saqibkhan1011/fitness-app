import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final TextEditingController _weightController = TextEditingController();
  final List<Map<String, String>> _entries = [];

  void _addEntry() {
    final weight = _weightController.text.trim();
    if (weight.isEmpty) return;

    final date = DateTime.now();
    final formattedDate = "${date.day}/${date.month}/${date.year}";

    setState(() {
      _entries.insert(0, {
        'date': formattedDate,
        'weight': weight,
      });
      _weightController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter current weight (kg)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addEntry,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _entries.isEmpty
                  ? Center(child: Text("No entries yet."))
                  : ListView.builder(
                itemCount: _entries.length,
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.trending_up, color: Colors.green),
                      title: Text("Weight: ${entry['weight']} kg"),
                      subtitle: Text("Date: ${entry['date']}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
