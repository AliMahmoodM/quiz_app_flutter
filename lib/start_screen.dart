import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/quiz_brain.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreenFun, {super.key});

  final void Function() switchScreenFun;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color(0xCDFFFFFF),
          ),
          SizedBox(height: 40),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 40),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt, color: Colors.white),
            onPressed: () {
              activeScreen = 'questions-screen';
              switchScreenFun();
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white),
            ),
            label: Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
