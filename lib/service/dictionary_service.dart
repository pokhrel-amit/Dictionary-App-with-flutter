import 'dart:convert';

import 'package:dictionary_app_flutter/constants/app_constants.dart';
import 'package:dictionary_app_flutter/constants/error_string.dart';
import 'package:dictionary_app_flutter/data/word.dart';
import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;

class DictionaryService {
  Future<Word?> getData(String word) async {
    final response;
    try {
      response = await http.get(
          Uri.parse('${AppConstants.baseUrl}$word?key=${AppConstants.apiKey}'));
      if (response.statusCode != 200) {
        throw Exception('Error From Server!');
      }
      final List decodedJson = jsonDecode(response.body);

      final parsedData = decodedJson.isNotEmpty ? decodedJson[0] : '';

      final meaning = parsedData != '' ? parsedData['shortdef'][0] : '';

      final audioFile = parsedData != ''
          ? parsedData['hwi']['prs'].length != 0
              ? parsedData['hwi']['prs'][0]['sound']['audio']
              : ''
          : '';
      return Word(word: word, meaning: meaning, audioFile: audioFile);
    } catch (e) {
      print('Error Reason: $e');
    }
  }

  getAudioUrl(String audioFileName) {
    String subDirectory = '';
    final alphabetsOnly = RegExp(r'^[A-Za-z]');

    if (audioFileName.isEmpty) {
      throw Exception(ErrorStrings.invalidAudioFile);
    }

    if (audioFileName.startsWith('bix')) {
      subDirectory = 'bix';
    } else if (audioFileName.startsWith('gg')) {
      subDirectory = 'gg';
    } else if (!alphabetsOnly.hasMatch(audioFileName)) {
      subDirectory = 'number';
    }
    else{
      subDirectory=audioFileName[0];
    }

    return ('${AppConstants.audioBaseUrl}$subDirectory/$audioFileName.mp3');
  }
}
