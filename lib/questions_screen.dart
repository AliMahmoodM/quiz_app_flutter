import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/quiz_brain.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.addUserAnswer,
    required this.switchScreenF,
  });
  final void Function(String answer) addUserAnswer;
  final Function() switchScreenF;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    void nextQuestion(String item) {
      widget.addUserAnswer(item);
      if (userAnsweredList.length == questions.length) {
        activeScreen = 'result-screen';
        widget.switchScreenF();
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade900,
                Colors.deepPurple.shade700,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentQuestion.questionText,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // The spread operator (...) unwraps the mapped iterable into a list of widgets.
                  ...currentQuestion.copiedListShuffled().map((choice) {
                    return AnswerButton(
                      answer: choice,
                      onTap: () {
                        nextQuestion(choice);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
