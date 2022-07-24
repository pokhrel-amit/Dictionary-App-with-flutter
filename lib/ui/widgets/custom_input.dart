import 'package:dictionary_app_flutter/constants/app_strings.dart';
import 'package:dictionary_app_flutter/ui/theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key, this.onType}) : super(key: key);
  final Function(String)? onType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onType,
          style: customTheme.textTheme.headline1,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(207, 1, 3, 24),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade800,
              ),
            ),
            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white30,
            hintText: AppStrings.hintText,
            hintStyle: const TextStyle(color: Color.fromARGB(207, 1, 3, 24)),

            icon: const Icon(
              Icons.text_fields,
              color: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
