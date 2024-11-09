import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatbot')),
      body: Center(
        child: Text(
          'Ask the chatbot your recycling questions!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
