import 'package:flutter/material.dart';

// TextAnnotation class
class TextAnnotation {
  final Offset position;
  final String text;
  final Color textColor;
  final double fontSize;

  TextAnnotation({
    required this.position,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 16.0,
  });
}