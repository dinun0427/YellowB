import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(hintText: "Enter your feedback here"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendEmail,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}