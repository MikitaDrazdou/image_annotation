# Flutter Image Annotation

This library provides an easy-to-use solution for adding image annotation capabilities to Flutter applications. With this library, users can draw shapes, add text, highlight specific areas, and resize annotations within a defined picture zone.

## Demo

![Demo](https://github.com/MikitaDrazdou/image_annotation/blob/main/demo/demo.gif)

## Features
* Drawing shapes (Line, Rectangle, Oval) on images
* Adding custom text annotations on images
* Highlighting specific areas of an image
* Resizing annotations within the picture zone
* Clearing all or last annotation

## Installation

To add this library to your Flutter project, include it in your pubspec.yaml file:

```yaml
dependencies:
    image_annotation: ^latest_version
```
Then run the following command in your terminal:

```yaml
flutter pub get image_annotation
```
## Usage
Import the package:

```dart
import 'package:image_annotation/image_annotation.dart';
```
Then, you can use the ImageAnnotation widget in your app. You can specify the type of annotation ('line', 'rectangle', 'oval', 'text') and the image path.

```dart
ImageAnnotation(
    imagePath: "assets/images/example.png",
    annotationType: "rectangle",
)
```
## Quick Example

```dart
import 'package:flutter/material.dart';
import 'package:image_annotation/image_annotation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                body: ImageAnnotation(
                    imagePath: 'images/my_image.png',
                    annotationType: 'line',
                ),
            ),
        );
    }
}
```
## Contact

* Edu email : m.drazdou@innopolis.university
* Telegram : @droz_nik