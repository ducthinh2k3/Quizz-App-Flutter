import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            "https://raw.githubusercontent.com/academind/flutter-complete-guide-course-resources/main/Lecture%20Attachments/03%20Flutter%20%26%20Dart%20Basics%20II/assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.network(
          //     "https://raw.githubusercontent.com/academind/flutter-complete-guide-course-resources/main/Lecture%20Attachments/03%20Flutter%20%26%20Dart%20Basics%20II/assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quizz'),
          ),
        ],
      ),
    );
  }
}
