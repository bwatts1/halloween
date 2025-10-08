import 'package:flutter/material.dart';
import 'dart:math';
import 'music_service.dart';
import 'spooky_item.dart';
import 'painter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  final List<SpookyItem> items = [
    SpookyItem('ghost1', false),
    SpookyItem('ghost2', false),
    SpookyItem('bat1', false),
    SpookyItem('bat2', false),
    SpookyItem('pumpkin', true),
    SpookyItem('ghost3', false),
    SpookyItem('bat3', false),
  ];

  late final List<AnimationController> controllers;
  late final List<Animation<Offset>> animations;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(items.length, (_) {
      return AnimationController(
        vsync: this,
        duration: Duration(seconds: 3 + Random().nextInt(3)),
      )..repeat(reverse: true);
    });

    animations = controllers.map((controller) {
      return Tween<Offset>(
        begin: Offset(Random().nextDouble(), Random().nextDouble()),
        end: Offset(Random().nextDouble(), Random().nextDouble()),
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  CustomPainter getPainter(String name) {
    if (name.startsWith('ghost')) return GhostPainter();
    if (name.startsWith('bat')) return BatPainter();
    if (name == 'pumpkin') return PumpkinPainter();
    return BatPainter(); // fallback
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
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

          // Animated spooky painters
          ...List.generate(items.length, (i) {
            return AnimatedBuilder(
              animation: animations[i],
              builder: (context, child) {
                final offset = animations[i].value;
                final screenSize = MediaQuery.of(context).size;
                final top = offset.dy * (screenSize.height - 100);
                final left = offset.dx * (screenSize.width - 100);

                return Positioned(
                  top: top,
                  left: left,
                  child: GestureDetector(
                    onTap: () {
                      if (items[i].isWinning) {
                        MusicService().playSoundEffect('win.ogg');
                        Navigator.pushNamed(context, '/win');
                      } else {
                        MusicService().playSoundEffect('trap.ogg');
                      }
                    },
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CustomPaint(painter: getPainter(items[i].asset)),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}