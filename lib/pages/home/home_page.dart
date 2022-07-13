import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const content = "  KUMARSUNIL17";
    const divider = Divider();
    return Scaffold(
        body: ListView(
      children: [
        Text(content, style: textTheme.headline1),
        divider,
        Text(content, style: textTheme.headline2),
        divider,
        Text(content, style: textTheme.headline3),
        divider,
        Text(content, style: textTheme.headline4),
        divider,
        Text(content, style: textTheme.headline5),
        divider,
        Text(content, style: textTheme.headline6),
        divider,
        Text(content, style: textTheme.headlineLarge),
        divider,
        Text(content, style: textTheme.headlineMedium),
        divider,
        Text(content, style: textTheme.headlineSmall),
        divider,
        Text(content, style: textTheme.titleLarge),
        divider,
        Text(content, style: textTheme.titleMedium),
        divider,
        Text(content, style: textTheme.titleSmall),
        divider,
        Text(content, style: textTheme.displayLarge),
        divider,
        Text(content, style: textTheme.displayMedium),
        divider,
        Text(content, style: textTheme.displaySmall),
        divider,
        Text(content, style: textTheme.bodyLarge),
        divider,
        Text(content, style: textTheme.bodyMedium),
        divider,
        Text(content, style: textTheme.bodySmall),
        divider,
      ],
    ));
  }
}
