// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, prefer_const_declarations, unused_element

import 'package:evsu_student/component/choices.dart';
import 'package:flutter/material.dart';

import 'package:evsu_student/routes.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;

  void questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;

      if (answerScore) {
        _totalScore++;
      }
      _scoreTracker.add(answerScore
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.clear, color: Colors.red));

      if (_questionIndex + 1 == _quest.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
    });

    if (_questionIndex >= _quest.length) {
      _reset();
    }
  }

  void _reset() {
    _scoreTracker = [];
    _questionIndex = 0;
    _totalScore = 0;
    answerWasSelected = false;
    endOfQuiz = false;
  }

  final _quest = [
    {
      'question': '1.What Color is this?',
      'answers': [
        {'answerText': 'Yellow', 'score': true},
        {'answerText': 'Brown', 'score': false},
        {'answerText': 'black', 'score': false}
      ]
    },
    {
      'question': '2. What Color is this?',
      'answers': [
        {'answerText': 'Yellow', 'score': false},
        {'answerText': 'Red', 'score': true},
        {'answerText': 'black', 'score': false}
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
          backgroundColor: Colors.red[900],
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.isEmpty) SizedBox(height: 25.0),
                  if (_scoreTracker.isNotEmpty) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    _quest[_questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ...(_quest[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) => Choices(
                        answer: answer['answerText'] as String,
                        answerColor: answerWasSelected
                            ? answer['score'] as bool
                                ? Colors.green
                                : Colors.red
                            : Colors.white,
                        answerTap: () {
                          if (answerWasSelected) {
                            return;
                          }
                          questionAnswered(answer['score'] as bool);
                        },
                      )),
              SizedBox(height: 20.0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0)),
                  onPressed: () {
                    _nextQuestion();
                  },
                  child: Text(endOfQuiz ? 'Reset Exercise' : 'Next Question')),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${_quest.length}',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
