import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class FeedbackPage extends StatefulWidget {
  static const String routeName = '/feedback';

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Feedback'),
      ),
    );
  }
}
