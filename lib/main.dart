import 'package:dictionary_app_flutter/dictionary_app.dart';
import 'package:dictionary_app_flutter/ui/screen/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DictionaryApp();
  }
}
