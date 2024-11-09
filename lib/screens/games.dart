import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games')),
      body: Center(
        child: Text(
          'Play games to learn more about recycling!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
