import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/answers_button.dart';
import 'package:quizz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectedAnswer, {super.key});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ...currentQuestion.getShuffleList().map((answer) {
              return AnswersButton(
                answer,
                () {
                  answerQuestion(answer);
                },
              );
            })
            // AnswersButton(currentQuestion.answers[0], () {}),
            // AnswersButton(currentQuestion.answers[1], () {}),
            // AnswersButton(currentQuestion.answers[2], () {}),
            // AnswersButton(currentQuestion.answers[3], () {}),
          ],
        ),
      ),
    );
  }
}
