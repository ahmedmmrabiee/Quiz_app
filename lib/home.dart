import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool isSwitched = false;
  int answerNum0 = 0, answerNum1 = 0, answerNum2 = 0,  answerNum3= 0;

  int _totalScore = 0;
  int _questionIndex = 0;
  final List<Map<String, Object>> _listOfData = [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
       {'text' : 'Black' , 'score' : 10},
        {'text' : 'Red', 'score' : 15} ,
        { 'text' : 'Green' , 'score' : 20},
        {'text' : 'Blue' , 'score' :25}
      ]
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
    {'text' : 'Lion' , 'score' : 10},
    {'text' : 'Cat', 'score' : 15} ,
    { 'text' : 'Dog' , 'score' : 20},
    {'text' : 'Rabbit' , 'score' : 25}
    ]
    },

    {
      'questionText': 'What is your favourite player?',
      'answers': [
        {'text' : 'Zidan' , 'score' : 10},
        {'text' : 'Ronaldo', 'score' : 15},
        {'text' : 'Messi' , 'score' : 20},
        {'text' : 'Trika' , 'score' : 25},
    ]
    },

    {
      'questionText': 'What is your favourite team?',
      'answers': [
        {'text' : 'Madrid'    , 'score' : 10},
        {'text' : 'Ahly'  , 'score' : 15} ,
        {'text' : 'Barcelona' , 'score' : 20},
        {'text' : 'Man City'  , 'score' : 15} ,


    ]
    },
  ];
  // quesAnswerFunc(int score){
  //   // print(_questionIndex);
  //   // print(_totalScore);
  //   // print("answer is chosen!");
  //   _totalScore += score;
  //   setState(() {
  //     _questionIndex += 1;
  // });
  //   // print(_questionIndex);
  //   // print(_totalScore);
  //   // print("answer is chosen!");
  // }
  quesAnswerFunc(int score) {
    if (_questionIndex == 0){
      answerNum0 = score;
    }
    else if (_questionIndex == 1) {
      answerNum1 = score;
    }
    else if (_questionIndex == 2){
      answerNum2 = score;
    }
    else if (_questionIndex == 3) {
      answerNum3 = score;
    }
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    // print("_questionIndex=$_questionIndex");
    // print("num0=$answerNum0");
    // print("num1=$answerNum1");
    // print("num2=$answerNum2");
    // print("num3=$answerNum3");
    //
    // print("totalScore=$_totalScore");
  }
  restartAppFunc(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      answerNum0 = 0;
      answerNum1 = 0;
      answerNum2 = 0;
      answerNum3 = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Quiz App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: fc),),
        actions: [
          Switch(
              value:  isSwitched,
              //activeColor: Colors.black26,
               activeColor: Colors.white,
               activeTrackColor: Colors.grey,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,
              onChanged: (val){
          setState(() {
            isSwitched = val;
            // print(isSwitched);
            if(isSwitched == true){
              setState(() {
               bc = Colors.black87;
               fc = Colors.white;
              });
            }else if(isSwitched == false) {
              setState(() {
                bc = Colors.white70;
                fc = Colors.black;
              });
            }
          });

        })],
      ),
      body: Container(
        color: bc,
        width: double.infinity,
        child: _questionIndex < _listOfData.length ?
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Quiz(theListOfData: _listOfData,
          theQuesAnswerFunc: quesAnswerFunc,
          theQuestionIndex: _questionIndex,),
        )
            :  Result(restartApp: restartAppFunc , scoreText: _totalScore,)
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.arrow_back, color: fc,),
        onPressed: () {
          if (_questionIndex == 1) _totalScore -= answerNum0;
          if (_questionIndex == 2) _totalScore -= answerNum1;
          if (_questionIndex == 3) _totalScore -= answerNum2;
          if (_questionIndex == 4) _totalScore -= answerNum3;

          setState(() {
            if (_questionIndex > 0) {
              _questionIndex--;
            }
          });
          // print("_questionIndex=$_questionIndex");
          // print("num=$num");
          // print("totalScore=$_totalScore");
        },
      ),

    );

  }
}
