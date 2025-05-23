import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutTimerScreen extends StatefulWidget {
  final String workoutTitle;
  final int durationSeconds;

  const WorkoutTimerScreen({
    Key? key,
    required this.workoutTitle,
    this.durationSeconds = 30, // default 30 seconds
  }) : super(key: key);

  @override
  _WorkoutTimerScreenState createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
        _showCompletionDialog();
      }
    });
  }
  String _getWorkoutGif(String title) {
    switch (title) {
      case 'Full Body':
        return 'https://media.post.rvohealth.io/wp-content/uploads/sites/2/2019/05/CREATE-YOUR-OWN-WORKOUT_SQUAT.gif';
      case 'Upper Body':
        return 'https://media.giphy.com/media/Lo0S35bP1wHtcrL0sJ/giphy.gif';
      case 'Lower Body':
        return 'https://i.pinimg.com/originals/23/1a/5a/231a5a0be655e15011d6bc33841d63e6.gif';
      case 'Cardio Blast':
        return 'https://media.tenor.com/wO_h-RJahT0AAAAC/jumping-jacks.gif';
      case 'Core Focus':
        return 'https://media.tenor.com/y3u_QbDoU9cAAAAC/abs-exercise.gif';
      default:
        return 'https://media.tenor.com/2fxy-mG_mfMAAAAC/fullbody-workout.gif';
    }
  }


  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Workout Complete!'),
        content: Text('${widget.workoutTitle} finished. Great job!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // go back to detail screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.workoutTitle} Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Time Remaining', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),

            // ✅ Display a workout GIF
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                _getWorkoutGif(widget.workoutTitle),
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),
            Text(
              '$_remainingSeconds s',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.stop),
              label: Text("Stop Workout"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
