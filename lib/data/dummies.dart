

class Dummy {
  static List getQuestion(subject) {

    if (subject == 'COLORS') {
      return [
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
            {'answerText': 'Green', 'score': true},
            {'answerText': 'black', 'score': false}
          ]
        },
        {
          'question': '3. What Color is this?',
          'answers': [
            {'answerText': 'Orange', 'score': true},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'black', 'score': false}
          ]
        },
        {
          'question': '4. What Color is this?',
          'answers': [
            {'answerText': 'Orange', 'score': false},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'Blue', 'score': true}
          ]
        },
        {
          'question': '4. What Color is this?',
          'answers': [
            {'answerText': 'Orange', 'score': false},
            {'answerText': 'Green', 'score': false},
            {'answerText': 'Indigo', 'score': true}
          ]
        }
      ];
    }
    if(subject == 'SHAPES'){
       return [
        {
          'question': 'assets/questions/RECTANGLE.mp4',
          'unqiue' : 1,
          'answers': [
            {'answerText': 'SQUARE', 'score': false},
            {'answerText': 'CIRCLE', 'score': false},
            {'answerText': 'RECTANGLE', 'score': true}
          ]
        },
        {
          'question': 'assets/questions/SQUARE.mp4',
          'unqiue' : 2,
          'answers': [
            {'answerText': 'RECTANGLE', 'score': false},
            {'answerText': 'SQUARE', 'score': true},
            {'answerText': 'DIAMOND', 'score': false}
          ]
        },
        {
          'question': 'assets/questions/DIAMOND.mp4',
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
