import 'package:flutter/material.dart';
import 'package:image_annotation/src/text_annotation.dart';

// AnnotationPainter class
class AnnotationPainter extends CustomPainter {
  final List<List<Offset>> annotations;
  final List<TextAnnotation> textAnnotations;
  final String annotationType;

  AnnotationPainter(
      this.annotations, this.textAnnotations, this.annotationType);

  // Paint annotations and text on the canvas
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (var annotation in annotations) {
      if (annotation.isNotEmpty) {
        if (annotationType == 'line') {
          for (var i = 0; i < annotation.length - 1; i++) {
            canvas.drawLine(annotation[i], annotation[i + 1], paint);
          }
        } else if (annotationType == 'rectangle') {
          final rect = Rect.fromPoints(annotation.first, annotation.last);
          canvas.drawRect(rect, paint);
        } else if (annotationType == 'oval') {
          final oval = Rect.fromPoints(annotation.first, annotation.last);
          canvas.drawOval(oval, paint);
        }
      }
    }

    drawTextAnnotations(canvas); // Draw text annotations
  }

  // Draw text annotations on the canvas
  void drawTextAnnotations(Canvas canvas) {
    for (var annotation in textAnnotations) {
      final textSpan = TextSpan(
        text: annotation.text,
        style: TextStyle(
            color: annotation.textColor, fontSize: annotation.fontSize),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final textPosition = Offset(
        annotation.position.dx - textPainter.width / 2,
        annotation.position.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, textPosition);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}