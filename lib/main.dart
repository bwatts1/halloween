import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'game_screen.dart';
import 'win_screen.dart';
import 'music_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MusicService().playBackgroundMusic();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/game': (context) => const GameScreen(),
        '/win': (context) => const WinScreen(),
      },
    );
  }
}