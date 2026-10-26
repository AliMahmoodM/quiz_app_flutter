import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/quiz_brain.dart';

class QuizSummary extends StatefulWidget {
  const QuizSummary(this.quizSummaryL, {super.key});

  final List<Map<String, Object>> quizSummaryL;

  @override
  State<QuizSummary> createState() => _QuizSummaryState();
}

class _QuizSummaryState extends State<QuizSummary> {
  Color colorBackground = Colors.green;

  List<Color> colorBackgroundList = [];

  List<Color> get chooseColor {
    for (int i = 0; i < widget.quizSummaryL.length; i++) {
      if (questions[i].answers[0] == userAnsweredList[i]) {
        colorBackgroundList.add(Colors.green);
      } else {
        colorBackgroundList.add(Colors.red);
      }
    }
    return colorBackgroundList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: widget.quizSummaryL.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: chooseColor.map((item) {
                    return item == Colors.green
                        ? Colors.green
                        : Colors.red; //ternary operator
                  }).toList()[(data['question_index'] as int) - 1],
                  radius: 17,
                  child: Text(
                    data['question_index'].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    // width: 300,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Row(
                          children: [
                            Text(
                              'Correct answer: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              data['correct_answer'].toString(),
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Your answer: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              data['user_answer'].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(), //convert iterable (map) to list
        ),
      ),
    );
  }
}
