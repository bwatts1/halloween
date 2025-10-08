import 'package:flutter/material.dart';
import 'dart:math';
import 'music_service.dart';
import 'spooky_item.dart';
import 'painter.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SpookyItem> items = [
      SpookyItem('ghost', false),
      SpookyItem('bat', false),
      SpookyItem('pumpkin', true), 
    ];

    return Scaffold(
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
          ...items.map((item) {
            final top = Random().nextDouble() * 500;
            final left = Random().nextDouble() * 300;

            CustomPainter painter;
            switch (item.asset) {
              case 'ghost':
                painter = GhostPainter();
                break;
              case 'bat':
                painter = BatPainter();
                break;
              case 'pumpkin':
                painter = PumpkinPainter();
                break;
              default:
                painter = BatPainter(); 
            }

            return Positioned(
              top: top,
              left: left,
              child: GestureDetector(
                onTap: () {
                  if (item.isWinning) {
                    MusicService().playSoundEffect('win.ogg');
                    Navigator.pushNamed(context, '/win');
                  } else {
                    MusicService().playSoundEffect('trap.ogg');
                  }
                },
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CustomPaint(
                    painter: painter,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}