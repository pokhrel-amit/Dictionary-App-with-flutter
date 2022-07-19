import 'package:dictionary_app_flutter/ui/theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: customTheme.textTheme.headline1,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade500,),),
            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow),),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white30,
            icon: Icon(
              Icons.text_fields,
              color: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
