
import 'package:flutter/material.dart';
import 'painter.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halloween Book'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        hero(
            tag: 'dash',
            child: const Text('Open second screen'),
            onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(
                    builder: (context) => const SecondScreen(),
                    ),
                );
            },
        )
      ),
    );
  }
}