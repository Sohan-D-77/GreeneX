import 'package:flutter/material.dart';

class RecyclingTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recycling Tips')),
      body: Center(
        child: Text(
          'Tips for effective recycling.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
