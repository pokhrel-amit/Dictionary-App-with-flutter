import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
  });
  final Widget title;
  final Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        child: ElevatedButton(
          child: title,
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
          ),
        ),
      ),
    );
  }
}
