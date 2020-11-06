import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIdex = 0;
  var _scoreResult = 0;
  final _questions = const [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 6},
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Lion', 'score': 10},
      ],
    },
    {
      'questionText': 'Who\s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 6},
        {'text': 'John', 'score': 4},
        {'text': 'Rya', 'score': 5},
        {'text': 'Leon', 'score': 2},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIdex = _questionIdex + 1;
    });

    _scoreResult += score;

    print(_scoreResult);
  }

  void _resetQuiz() {
    setState(() {
      _questionIdex = 0;
      _scoreResult = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIdex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIdex: _questionIdex,
              )
            : Result(_scoreResult, _resetQuiz),
      ),
    );
  }
}
