// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, prefer_const_declarations, unused_element, prefer_typing_uninitialized_variables
import 'package:evsu_student/component/choices.dart';
import 'package:evsu_student/data/dummies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:evsu_student/component/chewie.dart';

class Question extends StatefulWidget {
  final subjectId;
  const Question({Key? key, this.subjectId}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String defaultPath = '-';
  UniqueKey _uniqueKey = UniqueKey();
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool _correctAnswerSelected = false;
  void questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;

      if (answerScore) {
        _totalScore++;
        _correctAnswerSelected = true;
      }
      _scoreTracker.add(answerScore
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.clear, color: Colors.red));

      if (_questionIndex + 1 == _getData().length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _correctAnswerSelected = false;
      _questionIndex++;
      answerWasSelected = false;
      defaultPath = _getData()[_questionIndex]['question'];
      _uniqueKey = UniqueKey();
    });

    if (_questionIndex == _getData().length - 1) {
      _reset();
    }
  }

  void _reset() {
    _scoreTracker = [];
    _questionIndex = 0;
    _totalScore = 0;
    answerWasSelected = false;
    endOfQuiz = false;
    defaultPath = '-';
  }

  _getData() {
    return Dummy.getQuestion(widget.subjectId);
  }

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
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(10.0)),
                child: VideoScreen(
                      path: defaultPath == '-'
                          ? _getData()[_questionIndex]['question']
                          : defaultPath,
                      unique: _uniqueKey)
              ),
              ...(_getData()[_questionIndex]['answers']
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
                    if (!answerWasSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Please select an answer before going to the next question.'),
                      ));
                      return;
                    }
                    _nextQuestion();
                  },
                  child: Text(endOfQuiz ? 'Reset Exercise' : 'Next Question')),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${_getData().length}',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              if (answerWasSelected && !endOfQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: _correctAnswerSelected ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      _correctAnswerSelected
                          ? 'Well done, you got it right.'
                          : 'Wrong :/',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              if (endOfQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                        _totalScore >= 4
                            ? 'Congratulations! Your final score is: $_totalScore.'
                            : 'Your final score is: $_totalScore. Better luck next time.',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color:
                                _totalScore >= 4 ? Colors.green : Colors.red)),
                  ),
                ),
            ],
          ),
        ));
  }
}
