import 'package:flutter/material.dart';
import 'package:fitness/screens/workout/workout_timer_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const WorkoutDetailScreen({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  // Optional dummy image for now
  String get workoutImage {
    switch (title) {
      case 'Full Body':
        return 'data:image/jpeg;base64,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';
      case 'Upper Body':
        return 'data:image/jpeg;base64,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';
      case 'Lower Body':
        return 'https://www.puregym.com/media/e2ql51mx/lower-body-hiit-workout.jpg?quality=80';

      case 'Cardio Blast':
        return '';
      case 'Core Focus':
        return 'https://via.placeholder.com/300x200.png?text=Core+Workout';
      default:
        return 'https://via.placeholder.com/300x200.png?text=Workout';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(workoutImage),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recommended Sets & Reps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                _getWorkoutSets(title),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutTimerScreen(
                          workoutTitle: title,
                          durationSeconds: 30, // You can change duration as needed
                        ),
                      ),
                    );
                  },

                  icon: Icon(Icons.play_arrow),
                  label: Text("Start Workout"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getWorkoutSets(String title) {
    switch (title) {
      case 'Full Body':
        return '3 sets x 12 reps (squats, push-ups, planks)';
      case 'Upper Body':
        return '4 sets x 10 reps (push-ups, shoulder press)';
      case 'Lower Body':
        return '4 sets x 15 reps (squats, lunges)';
      case 'Cardio Blast':
        return '20 mins HIIT: 30s work, 10s rest';
      case 'Core Focus':
        return '3 sets x 20 reps (crunches, leg raises)';
      default:
        return '3 sets x 10 reps';
    }
  }
}
