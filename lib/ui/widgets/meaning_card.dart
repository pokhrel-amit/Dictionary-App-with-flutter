import 'package:dictionary_app_flutter/constants/app_strings.dart';
import 'package:dictionary_app_flutter/constants/error_string.dart';
import 'package:dictionary_app_flutter/data/audio_playing.dart';
import 'package:dictionary_app_flutter/data/word.dart';
import 'package:dictionary_app_flutter/service/dictionary_service.dart';
import 'package:flutter/material.dart';

class MeaningCard extends StatelessWidget {
  MeaningCard({required this.word});

  Word word;

  void playSound() {
    DictionaryService dictionaryService = DictionaryService();
    String url = dictionaryService.getAudioUrl(word.audioFile);
    AudioPlaying().playAudio(url);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 280,
        width: width,
        child: Card(
          semanticContainer: true,
          color: Theme.of(context).cardTheme.color,
          elevation: Theme.of(context).cardTheme.elevation,
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                word.word.isNotEmpty
                    ? Text(
                        '${AppStrings.word} ${word.word}',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    : Container(),
                Text(
                  word.meaning.isNotEmpty ? '${word.meaning}' : ErrorStrings.na,
                  style: Theme.of(context).textTheme.headline4,
                ),
                word.audioFile.isNotEmpty
                    ? InkResponse(
                        splashColor: Colors.grey.shade800,
                        onTap: playSound,
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.white,
                          size: 32,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
