
import 'package:flutter/material.dart';
import 'painter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halloween Book'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.book),
      ),
    );
  }
}