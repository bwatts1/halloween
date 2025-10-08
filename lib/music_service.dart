import 'package:audioplayers/audioplayers.dart';

class MusicService {
  static final MusicService _instance = MusicService._internal();
  factory MusicService() => _instance;

  late final AudioPlayer _player;

  MusicService._internal() {
    _player = AudioPlayer();
  }

  Future<void> playBackgroundMusic() async {
    await _player.play(AssetSource('audio/background.ogg'));
    await _player.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> playSoundEffect(String fileName) async {
    final effectPlayer = AudioPlayer();
    await effectPlayer.play(AssetSource('audio/$fileName'));
  }

  Future<void> stopMusic() async {
    await _player.stop();
  }
}