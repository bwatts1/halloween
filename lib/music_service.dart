// music_service.dart
import 'package:audioplayers/audioplayers.dart';

class MusicService {
  static final MusicService _instance = MusicService._internal();
  factory MusicService() => _instance;

  late final AudioPlayer _player;

  MusicService._internal() {
    _player = AudioPlayer();
  }

  Future<void> playBackgroundMusic() async {
    await _player.play(AssetSource('audio/background.mp3'));
    await _player.setReleaseMode(ReleaseMode.loop); // loop music
  }

  Future<void> stopMusic() async {
    await _player.stop();
  }
}
