import 'package:flutter/material.dart';

class CustomLinkedCenteredText extends StatelessWidget {
  final Function onTapAction;
  final String text;
  final TextStyle style;

  CustomLinkedCenteredText({this.text, this.onTapAction, this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapAction(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Center(
          child: Text(text, style: style),
        ),
      ),
    );
  }
}
