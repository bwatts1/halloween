import 'package:flutter/material.dart';
import 'music_service.dart'; // Make sure this is imported

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halloween Book'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/entrence.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await MusicService().playBackgroundMusic();
                } catch (e) {
                  debugPrint('Music playback failed: $e');
                }

                Navigator.of(context).pushNamed('/game');
              },
              child: const Text('Start the Spooky Hunt'),
            ),
          ),
        ],
      ),
    );
  }
}