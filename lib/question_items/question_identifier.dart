import "package:flutter/material.dart";

// This widget shows the question number inside a colored circle.
// The color changes based on whether the user's answer was correct or not.
class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
    this.isCorrectAnswer,
    this.questionIndex, {
    super.key,
  });

  // The index of the question (0-based, so we add +1 when displaying)
  final int questionIndex;

  // Whether the user's answer was correct (affects the circle color)
  final bool isCorrectAnswer;

  @override
  Widget build(context) {
    final questionNumber =
        questionIndex + 1; // Convert index to human-friendly numbering

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center, // Center the number inside the circle
      decoration: BoxDecoration(
        // Circle color depends on correctness: blue for correct, orange for wrong
        color: isCorrectAnswer ? Colors.blueAccent : Colors.deepOrange,
        borderRadius: BorderRadius.circular(100), // Makes it perfectly circular
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black, // Black text for visibility
        ),
      ),
    );
  }
}
