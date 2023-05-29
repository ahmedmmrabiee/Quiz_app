import 'package:flutter/material.dart';

import 'answers.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key, required this.theQuestionIndex, required this.theQuesAnswerFunc, required this.theListOfData}) : super(key: key);

  final int theQuestionIndex ;
  //final void Function(int s) theQuesAnswerFunc;
  final Function theQuesAnswerFunc;
  final List<Map<String, Object>> theListOfData;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children:[
        const SizedBox(height: 10,),
        Questions(questionText: theListOfData[theQuestionIndex]['questionText']),

    //...(theListOfData[theQuestionIndex]['answers'] as List<String, Object>).map((e){
      //return Answers(answerText: e, onPressedFunc: theQuesAnswerFunc);
    //}).toList() ,

        ...(theListOfData[theQuestionIndex]['answers'] as List<Map<String , Object>>).map((theAnswer){
          return Answers(answerText: theAnswer['text'], onPressedFunc: () => theQuesAnswerFunc((theAnswer['score'])));
        }).toList()

      ],
    );
  }
}
