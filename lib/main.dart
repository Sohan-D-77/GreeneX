import 'package:flutter/material.dart';
import 'screens/image_recognition.dart';
import 'screens/recycling_centers.dart';
import 'screens/recycling_tips.dart';
import 'screens/games.dart';
import 'screens/plans_tracking.dart';
import 'screens/education.dart';
import 'screens/chatbot.dart';
import 'screens/shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenEX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome, User'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            _buildFeatureButton(context, 'Image Recognition', Icons.camera, ImageRecognitionScreen()),
            _buildFeatureButton(context, 'Recycling Centers', Icons.location_on, RecyclingCentersScreen()),
            _buildFeatureButton(context, 'Recycling Tips', Icons.tips_and_updates, RecyclingTipsScreen()),
            _buildFeatureButton(context, 'Games', Icons.videogame_asset, GamesScreen()),
            _buildFeatureButton(context, 'Plans & Tracking', Icons.track_changes, PlansTrackingScreen()),
            _buildFeatureButton(context, 'Educational Content', Icons.book, EducationScreen()),
            _buildFeatureButton(context, 'Chatbot', Icons.chat, ChatbotScreen()),
            _buildFeatureButton(context, 'Shop', Icons.store, ShopScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, String label, IconData icon, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
