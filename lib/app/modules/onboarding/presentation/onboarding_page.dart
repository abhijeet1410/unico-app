import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar
/// On 14-08-2022 11:28 AM
///
class OnBoardingPage extends StatelessWidget {
  static const routeName = "/on-boarding";
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Onboard"),
      ),
    );
  }
}
