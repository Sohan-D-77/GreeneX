import 'package:flutter/material.dart';

class ImageRecognitionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Recognition')),
      body: Center(
        child: Text(
          'Use this screen to scan items for recycling information.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
