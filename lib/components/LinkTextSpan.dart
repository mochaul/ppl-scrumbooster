import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkTextSpan extends TextSpan {

  LinkTextSpan({
    TextStyle style,
    String text,
    VoidCallback action,
  }) : super(
    style: style,
    text: text,
    recognizer: TapGestureRecognizer()..onTap = action,
  );
}
