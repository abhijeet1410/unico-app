import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  static const String routeName = '/feedback';

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
    );
  }
}
