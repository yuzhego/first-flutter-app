import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Thank you for participating!';
    if (resultScore <= 15) {
      resultText = "I recommend McDonald's for you.";
    } else if (resultScore <= 23) {
      resultText = "I recommend The Cheese Cake Factory for you.";
    } else {
      resultText = "I recommend the best steak house for you.";
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          RaisedButton(
            child: Text('Restart Quiz!'),
            onPressed: resetHandler,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
