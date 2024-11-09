import 'package:flutter/material.dart';

class PlansTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recycling Plans & Tracking')),
      body: Center(
        child: Text(
          'Track your recycling progress here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
