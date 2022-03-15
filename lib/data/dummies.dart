

import 'package:evsu_student/global/global.dart';

class Dummy {
  static List getQuestion(subject) {

    if (subject == 'COLORS') {
      return [
        {
          'question': '$apiUrl/a/GREEN.mp4',
          'answers': [
            {'answerText': '$apiUrl/a/green.jpg', 'score': true},
            {'answerText': '$apiUrl/a/red.gif', 'score': false},
            {'answerText': '$apiUrl/a/blue.png', 'score': false}
          ]
        },
        {
          'question': '$apiUrl/a/RED.mp4',
          'answers': [
            {'answerText': '$apiUrl/a/green.jpg', 'score': false},
            {'answerText': '$apiUrl/a/red.gif', 'score': true},
            {'answerText': '$apiUrl/a/blue.png', 'score': false}
          ]
        },
        {
          'question': '$apiUrl/a/BLUE.mp4',
          'answers': [
            {'answerText': '$apiUrl/a/blue.png', 'score': true},
            {'answerText': '$apiUrl/a/green.jpg', 'score': false},
            {'answerText': '$apiUrl/a/red.gif', 'score': false}
          ]
        },
        {
          'question': '4. What Color is this?',
          'answers': [
            {'answerText': 'Orange', 'score': false},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'Blue', 'score': true}
          ]
        }
      ];
    }
    if(subject == 'SHAPES'){
       return [
        {
          'question': '$apiUrl/questions/RECTANGLE.mp4',
          'unqiue' : 1,
          'answers': [
            {'answerText': '$apiUrl/a/diamond.png', 'score': false},
            {'answerText': '$apiUrl/a/square.jpg', 'score': false},
            {'answerText': '$apiUrl/a/rect.png', 'score': true}
          ]
        },
        {
          'question': '$apiUrl/questions/SQUARE.mp4',
          'unqiue' : 2,
          'answers': [
            {'answerText': '$apiUrl/a/diamond.png', 'score': false},
            {'answerText': '$apiUrl/a/square.jpg', 'score': true},
            {'answerText': '$apiUrl/a/rect.png', 'score': false}
          ]
        },
        {
          'question': '$apiUrl/questions/DIAMOND.mp4',
          'unqiue' : 3,
          'answers': [
            {'answerText': '$apiUrl/a/diamond.png', 'score': true},
            {'answerText': '$apiUrl/a/square.jpg', 'score': false},
            {'answerText': '$apiUrl/a/rect.png', 'score': false}
          ]
        },
        {
          'question': '$apiUrl/questions/DIAMOND.mp4',
          'unqiue' : 3,
          'answers': [
            {'answerText': 'DIAMOND', 'score': true},
            {'answerText': 'CIRCLE', 'score': false},
            {'answerText': 'SQAURE', 'score': false}
          ]
        }
      ];
    }
    return [];
  }
}
