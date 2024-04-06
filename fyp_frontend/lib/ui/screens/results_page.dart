import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';

class ResultsPage extends StatefulWidget {
  final String diseaseName;
  final Uint8List xaiImage;
  final double confidenceLevel;
  final Uint8List uploadedImage;

  const ResultsPage(
      {Key? key,
      required this.diseaseName,
      required this.xaiImage,
      required this.confidenceLevel,
      required this.uploadedImage})
      : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.diseaseName == 'Unrecognized Disease' || widget.confidenceLevel < 0.9) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Center(
          child: Text(
            'Unrecognizable',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Constants.blackColor,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                color: Constants.primaryColor.withOpacity(.1),
                child: Column(
                  children: [
                    Image.memory(widget.uploadedImage),
                    Text(
                      'Disease Detected: ${widget.diseaseName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Constants.blackColor,
                      ),
                    ),
                    Text(
                      'Confidence Level: ${(widget.confidenceLevel * 100).toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Constants.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.memory(widget.xaiImage),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}