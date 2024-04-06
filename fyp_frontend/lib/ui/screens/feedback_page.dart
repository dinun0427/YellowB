import 'package:flutter/material.dart';
import 'package:fyp_frontend/ui/root_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/ui/screens/home_page.dart'; // Import HomePage

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();

  void _sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'dinunranasinghe@gmail.com',
      query: 'subject=Feedback&body=${_feedbackController.text}', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RootPage()), // Navigate to HomePage
      );
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              onChanged: (value) {
                setState(() {}); // Rebuild the widget when text field changes
              },
              decoration: InputDecoration(
                hintText: "Enter your feedback here",
                border: OutlineInputBorder(),
                fillColor: Constants.primaryColor.withOpacity(.1),
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _feedbackController.text.trim().isEmpty
                  ? null // Disable button when text field is empty
                  : _sendEmail,
              child: Text('Submit Feedback'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Constants.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                  fontSize: size.height / 6 * 0.15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}