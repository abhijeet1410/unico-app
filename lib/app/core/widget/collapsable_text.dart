import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 19-07-2021 01:49 PM
///
class CollapsableText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int initialCharCount;
  const CollapsableText(this.text,
      {this.style, this.initialCharCount = 150, Key? key})
      : super(key: key);

  @override
  _CollapsableTextState createState() => _CollapsableTextState();
}

class _CollapsableTextState extends State<CollapsableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String subListedText = widget.text.length > widget.initialCharCount
        ? widget.text.substring(0, widget.initialCharCount)
        : widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(isExpanded ? widget.text : subListedText, style: widget.style),
        const SizedBox(height: 4),
        if (widget.text.length > widget.initialCharCount)
          GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? "See less..." : "See more...",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )),
      ],
    );
  }
}
