import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/result_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';

List<String> userAnsweredList = [];
String activeScreen = 'start-screen';

class QuizBrain extends StatefulWidget {
  const QuizBrain({super.key});

  @override
  State<QuizBrain> createState() => _QuizBrainState();
}

class _QuizBrainState extends State<QuizBrain> {
  Widget? displayScreen;

  @override
  void initState() {
    displayScreen = StartScreen(switchScreen);
    super.initState();
  }

  ///////////////////////////////////////////////////////

  void switchScreen() {
    if (activeScreen == 'result-screen') {
      setState(() {
        displayScreen = ResultScreen(getQuizSummary, switchScreen);
      });
    } else if (activeScreen == 'questions-screen') {
      setState(() {
        displayScreen = QuestionsScreen(
          addUserAnswer: addUserAnswer,
          switchScreenF: switchScreen,
        );
      });
    } else {
      setState(() {
        displayScreen = StartScreen(switchScreen);
      });
    }
  }

  ///////////////////////////////////////////////////////

  void addUserAnswer(String userAnswer) {
    userAnsweredList.add(userAnswer);
  }

  ///////////////////////////////////////////////////////

  List<Map<String, Object>> getQuizSummary() {
    List<Map<String, Object>> quizSummary = [];
    for (int i = 0; i < questions.length; i++) {
      quizSummary.add({
        'question_index': i + 1,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': userAnsweredList[i],
      });
    }
    return quizSummary;
  }

  ///////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
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
          child: displayScreen,
        ),
      ),
    );
  }
}
