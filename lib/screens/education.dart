import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educational Content')),
      body: Center(
        child: Text(
          'Learn about waste management and recycling.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
