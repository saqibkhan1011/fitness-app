import 'package:flutter/material.dart';
import 'package:fitness/screens/workout/workout_detail_screen.dart';

class WorkoutScreen extends StatelessWidget {
  final List<Map<String, String>> workouts = [
    {
      'title': 'Full Body',
      'description': 'A balanced full-body workout to get started.',
    },
    {
      'title': 'Upper Body',
      'description': 'Focus on arms, chest, shoulders, and back.',
    },
    {
      'title': 'Lower Body',
      'description': 'Strengthen your legs, glutes, and calves.',
    },
    {
      'title': 'Cardio Blast',
      'description': 'Burn calories fast with this cardio session.',
    },
    {
      'title': 'Core Focus',
      'description': 'Target abs and core muscles for stability.',
    },
  ];

  final List<Color> cardColors = [
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.deepPurpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          final color = cardColors[index % cardColors.length];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailScreen(
                    title: workout['title']!,
                    description: workout['description']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.fitness_center, color: Colors.black87
                  ),
                ),
                title: Text(
                  workout['title']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  workout['description']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
