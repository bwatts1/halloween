import 'package:flutter/material.dart';
import 'painter.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
            Container(
                color: Colors.blue,
                width: 500,
                height: 500,
            ),
            Positioned(
                top: 50,
                left: 50,
                child: CustomPaint(
                    size: const Size(200, 200),
                    painter: BatPainter(), // Example flapProgress value
                    ),
            ),
            const Text('This is a test screen'),
            Positioned(
                top: 300,
                left: 50,
                child: CustomPaint(
                    size: const Size(200, 200),
                    painter: GhostPainter(), // Another example flapProgress value
                    ),
            ),
        ],
      ),
    );
  }
}