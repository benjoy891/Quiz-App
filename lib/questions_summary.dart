import "package:flutter/material.dart";
import "package:quiz_app/question_items/summary_items.dart";

// This widget shows a summary of all quiz questions and answers.
// It's scrollable so the user can see all questions even if there are many.
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  // A list containing maps with details for each question:
  // (index, question text, correct answer, user's answer)
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400, // Restrict height so it doesn’t take up the whole screen
      child: SingleChildScrollView(
        // Make the list scrollable if it's too long
        child: Column(
          // Convert each question's data into a SummaryItems widget
          children: summaryData.map((data) {
            return SummaryItems(
              data,
            ); // A custom widget for displaying one question's details
          }).toList(),
        ),
      ),
    );
  }
}
