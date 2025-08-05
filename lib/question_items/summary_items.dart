import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quiz_app/question_items/question_identifier.dart";

// This widget represents a single row in the quiz summary.
// It shows: question number (with color), question text, user's answer, and correct answer.
class SummaryItems extends StatelessWidget {
  const SummaryItems(this.itemData, {super.key});

  // Contains one question's details: index, text, correct answer, user answer
  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    // Check if the user's answer matches the correct answer
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
      children: [
        // Show the question number inside a colored circle (green if correct, red if wrong)
        QuestionIdentifier(isCorrectAnswer, itemData['question_index'] as int),

        const SizedBox(width: 20), // Space between number and text
        // Expanded so that text uses the remaining space
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show the question text
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),

              // Show what the user answered
              Text(
                "Your answer: ${itemData['user_answer'] as String}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 247, 245, 245), // Dark gray
                ),
              ),

              // Show the correct answer
              Text(
                "Correct answer: ${itemData['correct_answer'] as String}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 187, 187, 187),
                ), // Green text
              ),

              const SizedBox(height: 15), // Space after each question block
            ],
          ),
        ),
      ],
    );
  }
}
