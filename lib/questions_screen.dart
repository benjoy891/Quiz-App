import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// This screen shows the quiz questions and their answer options.
// It's a StatefulWidget because the current question changes as the user answers.
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  // A function passed from the parent widget.
  // It will be called whenever the user selects an answer.
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Keeps track of which question the user is currently on
  var currentQuestionIndex = 0;

  // Called when the user selects an answer.
  // Sends the answer back to the parent and moves to the next question.
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(
      selectedAnswer,
    ); // Inform parent about selected answer
    setState(() {
      currentQuestionIndex += 1; // Go to the next question
    });
  }

  @override
  Widget build(context) {
    // Get the current question based on the index
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // Make the screen take up full width
      child: Container(
        margin: const EdgeInsets.all(40), // Add some space around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch buttons to fill width
          children: [
            // Show the current question text
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Generate an AnswerButton for each possible answer
            // The "..." spreads the list of buttons into the children list
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer); // Handle answer selection
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
