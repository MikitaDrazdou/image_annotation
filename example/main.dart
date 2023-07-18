import 'package:flutter/material.dart';
import 'package:image_annotation/image_annotation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

enum AnnotationOption { line, rectangle, oval, text }

class _MyAppState extends State<MyApp> {
  // Define the scaffold key as final to prevent unintentional changes.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AnnotationOption selectedOption = AnnotationOption.line; // Default option.

// Helper function to return the annotation type as a string based on the selected option.
  String chooseAnnotationType(AnnotationOption option) {
    switch (option) {
      case AnnotationOption.line:
        return 'line';
      case AnnotationOption.rectangle:
        return 'rectangle';
      case AnnotationOption.oval:
        return 'oval';
      case AnnotationOption.text:
        return 'text';
    }
  }

// Function to handle tapping on the drawer options and update the selected option.
  void _handleDrawerOptionTap(AnnotationOption option) {
    setState(() {
      selectedOption = option;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Annotation Demo',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Image Annotation Demo'),
          centerTitle: true,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text('Image Annotation Types'),
                  accountEmail: Text('choose one option'),
                ),
              ),
              ListTile(
                title: Text('Line'),
                onTap: () => _handleDrawerOptionTap(AnnotationOption.line),
                selected: selectedOption == AnnotationOption.line,
              ),
              ListTile(
                title: Text('Rectangular'),
                onTap: () => _handleDrawerOptionTap(AnnotationOption.rectangle),
                selected: selectedOption == AnnotationOption.rectangle,
              ),
              ListTile(
                title: Text('Oval'),
                onTap: () => _handleDrawerOptionTap(AnnotationOption.oval),
                selected: selectedOption == AnnotationOption.oval,
              ),
              ListTile(
                title: Text('Text'),
                onTap: () => _handleDrawerOptionTap(AnnotationOption.text),
                selected: selectedOption == AnnotationOption.text,
              ),
            ],
          ),
        ),
        body: Center(
          child: ImageAnnotation(
            imagePath: 'assets/images/your_image.jpg',
            annotationType: chooseAnnotationType(selectedOption),
          ),
        ),
      ),
    );
  }
}
