import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function selectHandler;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  const Quiz({
    Key? key,
    required this.selectHandler,
    required this.questionIndex,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question: questions[questionIndex]['question'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map(
              (answer) => Answer(
                selectHandler: () => selectHandler(answer['score']),
                answer: answer['text'] as String,
              ),
            )
            .toList(),
      ],
    );
  }
}
