import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add Firebase Core
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/workout_screen.dart';
import 'screens/bmi_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp( // Initialize Firebase
    options: FirebaseOptions(
      apiKey: "AIzaSyAyAWPIyKNTIKovai7fdzIyqUPeehZAjYA", // From your google-services.json
      appId: "1:146657694168:android:0f702c0f9a18ab081b62ad", // mobilesdk_app_id
      messagingSenderId: "146657694168", // project_number
      projectId: "fitness-691fe", // project_id
      storageBucket: "fitness-691fe.firebasestorage.app", // storage_bucket
    ),
  );
  runApp(FitTrackApp());
}

class FitTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTrack Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/workout': (context) => WorkoutScreen(),
        '/bmi': (context) => BmiScreen(),
        '/progress': (context) => ProgressScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}