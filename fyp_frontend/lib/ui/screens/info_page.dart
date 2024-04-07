import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 227, 227),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "YellowB Application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "The YellowB application is designed to revolutionize the way we approach banana plant cultivation and disease management. Utilizing cutting-edge AI and machine learning technologies, YellowB assists farmers and gardeners in identifying and treating common banana leaf diseases.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Features",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "• Disease Identification: Snap a photo of a banana leaf, and YellowB will identify potential diseases.\n"
                            "• Treatment Suggestions: Receive recommendations for managing identified diseases.\n"
                            "• Cultivation Tips: Learn best practices for banana plant care to prevent diseases.\n"
                            "• Community Support: Connect with a community of experts and fellow gardeners for advice and tips.",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Our Mission",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "At YellowB, our mission is to empower those who feed the world. By providing accessible technology to diagnose and manage plant health, we aim to support sustainable agriculture practices globally.",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}