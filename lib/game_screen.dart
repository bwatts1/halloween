import 'package:flutter/material.dart';
import 'painter.dart';
import 'game_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

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
                        image: AssetImage("images/walk.jpeg"),
                        fit: BoxFit.cover, 
                        ),
                    ),
                ),  
            ),    
            Center(
                child: Hero(
                    tag: 'dash',
                    child: ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute<void>(
                            builder: (context) => const GameScreen(),
                            ),
                        );
                        },
                        child: const Text('Open second screen'),
                    ),
                ),
            ),
        ]
      ),
    );
  }
}