import 'package:flutter/material.dart';

import 'main.dart';


class Answers extends StatelessWidget {
  const Answers({Key? key, required this.answerText, required this.onPressedFunc}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final answerText ;
  final   Function() onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: double.infinity,
      height: 50,
      child: MaterialButton (
          onPressed: onPressedFunc ,
          color: buttonColor,
          textColor: Colors.white,
          splashColor: Colors.indigo,
          child: Text(answerText, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: fc))),
    );
  }
}
