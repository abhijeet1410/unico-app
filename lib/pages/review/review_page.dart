import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  static const String routeName = '/review';

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
    );
  }
}