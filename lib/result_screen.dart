import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

// This screen shows the quiz result (score + summary + restart button)
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.restartQuiz,
    required this.chosenAnswers,
  });

  // Function to restart the quiz (passed from the parent widget)
  final void Function() restartQuiz;

  // List of answers chosen by the user
  final List<String> chosenAnswers;

  // Builds a summary list that combines questions, correct answers, and user's answers
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // Go through each selected answer and create a "map" (row of details)
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i, // The question number
        'question': questions[i].text, // The question text
        'correct_answer':
            questions[i].answers[0], // The correct answer (first in the list)
        'user_answer': chosenAnswers[i], // The user's selected answer
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData(); // Build the detailed summary
    final numTotalQuestions = questions.length; // Total number of questions
    // Count how many answers were correct
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity, // Full width
      child: Container(
        margin: EdgeInsets.all(40), // Add padding around the content
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            // Show the user's score
            Text(
              "You got $numCorrectQuestions out of $numTotalQuestions questions correct!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Show a detailed summary (each question with correct/user answer)
            QuestionsSummary(summaryData),

            SizedBox(height: 20),

            // Button to restart the quiz
            ElevatedButton(onPressed: restartQuiz, child: Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
