import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz_brain.dart';
import 'package:quiz/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.getQuizSummaryF, this.switchScreenF, {super.key});
  final List<Map<String, Object>> Function() getQuizSummaryF;
  final void Function() switchScreenF;

  int calculateCorrectAnswers() {
    int total = getQuizSummaryF().where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return total;
  }

  // int correctAnswerCount = 0;
  // for (int i = 0; i < questions.length; i++) {
  //   if (questions[i].answers[0] == userAnsweredList[i]) {
  //     correctAnswerCount++;
  //   }
  // }
  // return correctAnswerCount;

  void restartQuiz() {
    activeScreen = 'start-screen';
    userAnsweredList = [];
    switchScreenF();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Corrected answers ${calculateCorrectAnswers()} out of ${userAnsweredList.length} questions",
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          QuizSummary(getQuizSummaryF()),
          SizedBox(height: 20),
          TextButton.icon(
            icon: Icon(Icons.refresh_sharp),
            onPressed: restartQuiz,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            label: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
