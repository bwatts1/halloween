import 'package:flutter/material.dart';
import 'painter.dart';
import 'second_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
                            builder: (context) => const SecondScreen(),
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