import 'package:dictionary_app_flutter/constants/app_strings.dart';
import 'package:dictionary_app_flutter/data/word.dart';
import 'package:dictionary_app_flutter/service/dictionary_service.dart';
import 'package:dictionary_app_flutter/ui/widgets/custom_button.dart';
import 'package:dictionary_app_flutter/ui/widgets/custom_input.dart';
import 'package:dictionary_app_flutter/ui/widgets/meaning_card.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String searchStr = '';
  Word? wordMeaning;
  bool isLoading = false;
  DictionaryService _dictionaryService = DictionaryService();
  void updateUi(String value) {
    setState(() {
      searchStr = value;
    });
  }

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void onPress() async {
    changeFocus();
    toggleLoading();
    final response = await _dictionaryService.getData(searchStr);
    setState(() {
      wordMeaning = response;
    });
    toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              AppStrings.appBarTitle,
              style: theme.textTheme.headline3,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          CustomInput(
            onType: updateUi,
          ),
           SizedBox(
            height: 15,
          ),
          CustomButton(
            backgroundColor: Colors.grey.shade900,
            title: const Center(
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () => onPress(),
            // backgroundColor: Colors.transparent
          ),
           SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade600,
          ),
           SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${isLoading ? AppStrings.searchingWord : AppStrings.word} $searchStr',
              style: theme.textTheme.headline2,
            ),
          ),
           SizedBox(
            height: 5,
          ),
          wordMeaning != null
              ? MeaningCard(
                  word: wordMeaning!,
                )
              : Container(),
        ],
      ),
    );
  }
}
