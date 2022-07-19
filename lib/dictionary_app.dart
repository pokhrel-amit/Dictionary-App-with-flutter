import 'package:dictionary_app_flutter/ui/screen/landing_screen.dart';
import 'package:dictionary_app_flutter/ui/theme.dart';
import 'package:flutter/material.dart';

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DictionaryScreen(),
      theme: customTheme,
    );
  }
}