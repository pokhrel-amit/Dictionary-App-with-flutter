import 'package:dictionary_app_flutter/constants/app_strings.dart';
import 'package:dictionary_app_flutter/ui/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.appBarTitle,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomInput(),
        ],
      ),
    );
  }
}
