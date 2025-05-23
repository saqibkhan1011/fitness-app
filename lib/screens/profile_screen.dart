import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name = "Fit User";
  final String email = "user@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.teal.shade100,
                child: Icon(Icons.person, size: 70, color: Colors.teal.shade800),
              ),
              SizedBox(height: 20),

              // Name and Email inside a Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        email,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Edit Button
              ElevatedButton.icon(
                onPressed: () {
                  // Future: navigate to profile editing screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Edit feature coming soon!")),
                  );
                },
                icon: Icon(Icons.edit),
                label: Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
