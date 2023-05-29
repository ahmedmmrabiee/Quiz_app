import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.restartApp, required this.scoreText, }) : super(key: key);

  final Function() restartApp;
  final int scoreText ;
  String get resultText{
    String textRes;
    if(scoreText >= 70){textRes = 'You are awesome';}
    else if(scoreText >= 40){textRes = 'Pretty likable';}
    else{textRes = 'You are so bad';}
    return textRes;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children:  [
            const SizedBox(height: 300,),
            //Text('your score is $scoreText' , style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
            Text(resultText , style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: fc),),
          const SizedBox(height: 20,),
          MaterialButton(onPressed: restartApp,
           color: Colors.cyan,
           child:  Text('RestartApp' , style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: fc),))
        ],
      ),
    );
  }
}
