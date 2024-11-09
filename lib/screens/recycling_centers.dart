import 'package:flutter/material.dart';

class RecyclingCentersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recycling Centers')),
      body: Center(
        child: Text(
          'Find nearby recycling centers.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
