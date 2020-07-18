import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite snack?',
      'answers': [
        {'text': 'Ice Cream', 'score': 10},
        {'text': 'Cheetos', 'score': 1},
        {'text': 'Cookies', 'score': 4},
        {'text': 'Brownies', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favorite entree?',
      'answers': [
        {'text': 'Burgers', 'score': 3},
        {'text': 'Taco', 'score': 5},
        {'text': 'Pad Thai', 'score': 8},
        {'text': 'Steak', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite drink?',
      'answers': [
        {'text': 'Coke', 'score': 1},
        {'text': 'Boba', 'score': 6},
        {'text': 'Beer', 'score': 8},
        {'text': 'Wine', 'score': 10}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print("No more questions");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
