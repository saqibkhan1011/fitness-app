import 'package:flutter/material.dart';
import 'dart:math';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  double? _bmi;
  String _result = '';

  void _calculateBMI() {
    final height = double.tryParse(heightController.text);
    final weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0) {
      final bmi = weight / pow(height / 100, 2);
      String status;

      if (bmi < 18.5) {
        status = "Underweight";
      } else if (bmi < 25) {
        status = "Normal";
      } else if (bmi < 30) {
        status = "Overweight";
      } else {
        status = "Obese";
      }

      setState(() {
        _bmi = bmi;
        _result = status;
      });
    } else {
      setState(() {
        _bmi = null;
        _result = "Invalid input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("BMI Calculator",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700,
                        )),
                    SizedBox(height: 30),
                    _buildInput(heightController, "Height (cm)"),
                    SizedBox(height: 16),
                    _buildInput(weightController, "Weight (kg)"),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _calculateBMI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text("Calculate BMI", style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 30),
                    if (_bmi != null)
                      Column(
                        children: [
                          Text(
                            "Your BMI: ${_bmi!.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Status: $_result",
                            style: TextStyle(fontSize: 18, color: Colors.teal.shade700),
                          ),
                        ],
                      )
                    else if (_result.isNotEmpty)
                      Text(
                        _result,
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.height),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
