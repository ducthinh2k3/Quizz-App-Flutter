import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/data/question.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/result_screent.dart';
import 'package:quizz_app/start_screen.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:134239673.
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var currentState = 'start-screen';

  void switchScreen() {
    setState(() {
      currentState = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        currentState = 'result-screen';
        // selectedAnswer = [];
      });
    }
  }

  void restartQuiz(){
    setState(() {
        currentState = 'question-screen';
        selectedAnswer = [];
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (currentState == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }
    if (currentState == 'result-screen'){
      screenWidget = ResultScreent(selectedAnswer, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
