import 'package:just_audio/just_audio.dart';

class AudioPlaying {
  final _player = AudioPlayer();
  void playAudio(String? url) async {
    
    try {
      if (url != null) {
        await _player.setUrl(
          url,
        );
        await _player.play();
      }
      
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }
}
