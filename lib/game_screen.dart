import 'package:flutter/material.dart';
import 'dart:math';
import 'music_service.dart';
import 'spooky_item.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SpookyItem> items = [
      SpookyItem('ghost.png', false),
      SpookyItem('bat.png', false),
      SpookyItem('pumpkin.png', true),
    ];

    return Scaffold(
      body: Stack(
        children: items.map((item) {
          final top = Random().nextDouble() * 500;
          final left = Random().nextDouble() * 300;
          return Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              onTap: () {
                if (item.isWinning) {
                  MusicService().playSoundEffect('win.mp3');
                  Navigator.pushNamed(context, '/win');
                } else {
                  MusicService().playSoundEffect('trap.mp3');
                }
              },
              child: Image.asset('assets/images/${item.asset}', width: 80),
            ),
          );
        }).toList(),
      ),
    );
  }
}