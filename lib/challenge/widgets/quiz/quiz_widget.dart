import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         SizedBox(height: 64,),
         Text(widget.question.title, style: AppTextStyles.heading),
         SizedBox(height: 24,),
         for(var index = 0; index < widget.question.answers.length; index++)
          AnswerWidget(
            answer: answer(index),
            disabled: indexSelected != -1,
            isSelected: indexSelected == index,
            onTap: (value) {
              indexSelected = index;
              setState(() {});
              Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(value));
            },
          ),
       ],
     ),
    );
  }
}