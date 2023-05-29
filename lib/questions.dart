import 'package:flutter/material.dart';

import 'main.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key,required this.questionText}) : super(key: key);


  // ignore: prefer_typing_uninitialized_variables
  final questionText ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 130,
      alignment: Alignment.center,
      decoration:   BoxDecoration(
        color: Colors.cyan,
        border: Border.all(
            color: Colors.grey,
            width: 6,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40)),

        //Color? color,   DecorationImage? image,   BoxBorder? border,   BorderRadiusGeometry? borderRadius,   List<BoxShadow>? boxShadow,   Gradient? gradient,   BlendMode? backgroundBlendMode,   BoxShape shape = BoxShape.rectangle,
      ),
      child: Text( questionText,
              textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: fc)

      ),
    );
  }
}
