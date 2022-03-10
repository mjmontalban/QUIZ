// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class Dummy {
  static List getQuestion(subject) {

    if (subject == 'COLORS') {
      return [
        {
          'question': '1.What Color is this?',
          'key': Colors.yellow,
          'answers': [
            {'answerText': 'Yellow', 'score': true},
            {'answerText': 'Brown', 'score': false},
            {'answerText': 'black', 'score': false}
          ]
        },
        {
          'question': '2. What Color is this?',
          'key': Colors.green,
          'answers': [
            {'answerText': 'Yellow', 'score': false},
            {'answerText': 'Green', 'score': true},
            {'answerText': 'black', 'score': false}
          ]
        },
        {
          'question': '3. What Color is this?',
          'key': Colors.orange,
          'answers': [
            {'answerText': 'Orange', 'score': true},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'black', 'score': false}
          ]
        },
        {
          'question': '4. What Color is this?',
          'key': Colors.blue,
          'answers': [
            {'answerText': 'Orange', 'score': false},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'Blue', 'score': true}
          ]
        },
        {
          'question': '4. What Color is this?',
          'key': Colors.indigo,
          'answers': [
            {'answerText': 'Orange', 'score': false},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'Indigo', 'score': true}
          ]
        }
      ];
    }
    return [];
  }
}
