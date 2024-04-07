import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';

class ResultsPage extends StatefulWidget {
  final String diseaseName;
  final Uint8List xaiImage;
  final double confidenceLevel;
  final Uint8List uploadedImage;
  final String culturalPractices; // Add this line
  final String chemicalControl;
  final String nutrientManagement; // Add this line

  const ResultsPage({
    Key? key,
    required this.diseaseName,
    required this.xaiImage,
    required this.confidenceLevel,
    required this.uploadedImage,
    required this.culturalPractices, // Add this line
    required this.chemicalControl,
    required this.nutrientManagement, // Add this line
  }) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 227),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.memory(widget.uploadedImage),
                        ),
                      ),
                      Text(
                        'Disease Detected: ${widget.diseaseName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Confidence Level: ${(widget.confidenceLevel * 100).toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Cultural Practices: ${widget.culturalPractices}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Chemical Controls: ${widget.chemicalControl}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Nutrient Management: ${widget.nutrientManagement}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 227, 227, 227),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        child: Image.memory(widget.xaiImage),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
